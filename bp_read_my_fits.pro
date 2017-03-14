; Filename:         bp_read_my_fits.pro
; Last modified:    09 March 2017
; Programmer:       Laurel Farris
; Description:      Read header info from fits files and restore data from .sav files
;                   Returns array of structures, one for each wavelength.
;                   Takes a minute or two to run...
;
; Maybe use a subfunction here for creating structures/reading headers, etc.


pro bp_read_my_fits, A, index, $
        path=path, waves=waves, temps=temps, get_data=get_data, $
        z=z, x_ref=x_ref, y_ref=y_ref, side=side


    ; path = path where data files are stored
    ; waves = array of wavelengths to look for
    ; z = number of files to read for each wavelength (essentially the 'z-direction' -> time )
    ; x_ref = center x coordinate of 193 data
    ; y_ref = (ditto for y)
    ; get_data = set this keyword to read data from fits files
    ; side = desired length (in pixels) of one side of image


    ;; Tags
    tags = "w" + waves[*]
    subtags = [ "wavelength", $
                "temperature", $
                "date", $
                "time", $
                "title", $
                "title2", $
                ;"cdelt1", $
                ;"cdelt2", $
                "data", $
                "xcen", $
                "ycen" $
                ]

    ;; Sub-structure (individual wavelengths)
    substruc = create_struct( subtags, $
        "", $  ; wavelength
        "", $  ; temperature
        make_array(z, /nozero), $   ; date
        make_array(z, /nozero), $   ; time (seconds since start time)
        "", $  ; title
        make_array(z, type=7), $  ; title2
        ;make_array(z), $ ; cdelt1
        ;make_array(z), $ ; cdelt2
        make_array(side, side, z, /nozero), $
        make_array(z), $
        make_array(z) $
        )
        ;name = "single_wave", $

    ;; Main structure
    ;A = create_struct( name = "bp", tags, substruc, substruc, substruc, substruc, substruc, substruc ) 
    A = replicate( substruc, n_elements(waves) )

    ;; Read headers and data, then put relevant values into a structure.
    foreach wave, waves, i do begin

        t = systime(/seconds)
        fls = (file_search(path + "*" + wave + "A*.fits"))[0:z-1]

        ;; Approximate spatial shift in pixels between each wavelength
        ;; PROBLEM: if running this code on a single wave, it won't have the correct shifts.
        ;x_shift = [0,0,7,0,-7,5]
        ;y_shift = [0,0,8,5,4,8]
        r = side/2

        ;; Trim coronal hole data cube down to BP of interest, with dimensions r x r
        ;;   (defined relative to 1000x1000 pixels)
        ;x_center = temporary(x_center) + x_shift[i]
        ;y_center = temporary(y_center) + y_shift[i]

        if keyword_set(get_data) then begin

            ;; Read data and header info from fits files (one wavelength, z images)
            read_sdo, fls, index, cube ;; --> may want to read in data in a subroutine,
                                        ;; in case I mess it up here...
            ;cube = cube[ x_ll : x_ll+r-1, y_ll : y_ll+r-1, * ]
            ;save, cube, path + "coronal_hole_" + wave + ".sav"
            A[i].data = cube[ x_center-r : x_center+r-1, y_center-r : y_center+r-1, * ]

        endif else begin

            ;; Read data from .sav files and headers from fits files
            read_sdo, fls, index
            print, wave
            print, x_ref, y_ref
            x_center = x_ref - round(index[0].xcen)
            y_center = y_ref - round(index[0].ycen)
            print, x_center, y_center
            restore, path + "aligned_" + wave + ".sav"
            A[i].data = cube[ x_center-r:x_center+r-1, y_center-r:y_center+r-1, * ]
        endelse


        time = strmid(index.date_obs, 17, 5) + 60.*strmid(index.date_obs, 14, 2)
        im_str = strtrim( indgen(z)+1, 1 )
        time_str = strtrim( round(time), 1 )
        wave_str = "$\lambda$=" + strtrim( string(index[0].wavelnth), 1 ) + " $\AA$"
        temp_str = "log(T)=" + temps[i] + " K"

        A[i].time = time
        A[i].wavelength = strtrim( string(index[0].wavelnth), 1 )
        A[i].temperature = temps[i]
        A[i].date = strmid( index.date_obs, 0, 9 )
        A[i].title = wave_str + ", " + temp_str
        A[i].title2 = wave_str + ", t=" + time_str + " seconds"
        ;A[i].cdelt1 = index.CDELT1
        ;A[i].cdelt2 = index.CDELT2
        A[i].xcen = index[0].xcen
        A[i].ycen = index[0].ycen

        ;date: strmid(index[0].date_obs, 0, 10)

        ; takes about 6 minutes...
        ;print, "Time to read index and put into structure: ", systime(/seconds) - t
    endforeach


end
