; Last modified:    25 April 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Read/restore data and headers, and create array of structures,
;                       one for each bandpass, with coronal hole data (1000x1000)



function BP_STRUCTURES

    common BP_BLOCK


    ;; initialize structures (one for each bandpass)
    substruc = { $
        wavelength : "", $
        temperature : "", $
        date : make_array(z, /string), $
        time : make_array(z, /string), $
        data : make_array(x, y, z, /nozero) }

    ;; Assemble substructures in array
    A = replicate( substruc, n_elements(waves) )

    ;; Compile read_my_fits.pro
    resolve_routine, "read_my_fits", /either


    ;; Read header information and data into structures
    foreach wave, waves, i do begin
    
        ;fls = ( file_search( path + "*" + wave + "A*.fits" ) )[0:z-1]

        READ_MY_FITS, index, data, wave
        A[i].wavelength = strtrim( string(index[0].wavelnth), 1 )
        A[i].temperature = strtrim( temps[i], 1 )
        A[i].date = strmid( index.date_obs,  0, 10 )
        A[i].time = strmid( index.date_obs, 11, 21 )
        A[i].data = data

    endforeach

    return, A



end
