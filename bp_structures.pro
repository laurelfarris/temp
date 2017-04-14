; Last modified:    06 April 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Read/restore data and headers, and create array of structures,
;                       one for each bandpass.

    ;; Note: Written to correct for shifts using header info,
    ;;   since corrections were not made before aligning.
    ;; Need to redo all data to correct from the beginning.

function bp_structures


    path = "/solarstorm/laurel07/Data/aia/"
    waves = ['131', '171', '193', '211', '304', '335']
    temps = ['7.0', '5.8', '7.3', '6.3', '4.7', 6.4]

    ;; Size of desired cube (x and y in spatial #pixels, z = #images, or 'time')
    x = 1000
    y = 1000
    z = 300

    ;; initialize structures (one for each bandpass)
    substruc = { $
        wavelength : "", $
        temperature : "", $
        date : make_array(z, /string), $
        time : make_array(z, /string), $
        seconds : make_array(z, /nozero), $
        data : make_array(x, y, z, /nozero) }

    ;; Assemble substructures in array
    A = replicate( substruc, n_elements(waves) )

    print, "initialized structures"

    ;; Restore data and read headers
    foreach wave, waves, i do begin

        print, "starting ", wave
        t1 = systime(/seconds)

        ;; Read in header info
        fls = ( file_search( path + "*" + wave + "A*.fits" ) )[0:z-1]
        READ_SDO, fls, index, cube, nodata=1

        ;; Restore aligned data (1000x1000; variable name = cube)
        restore, path + "aligned_" + wave + ".sav"

        ;; Shift cube according to header information
        data = shift( cube, round(index[0].xcen), round(index[0].ycen), 0 ) 

        minutes = float( strmid( index.date_obs, 14, 2 ) )
        seconds = float( strmid( index.date_obs, 17, 5 ) )

        ;; shift in x and y based on header (index.xcen, index.ycen).
        ;x_center = x_ref - round(index[0].xcen)
        ;y_center = y_ref - round(index[0].ycen)

        ;; Trim cube to desired range.
        ;data = cube[ $
        ;    x_center - (x/2)  :  x_center + (x/2)-1, $
        ;    y_center - (y/2)  :  y_center + (y/2)-1, $
        ;    0:z-1 ]


        A[i].wavelength = strtrim( string(index[0].wavelnth), 1 )
        A[i].temperature = strtrim( temps[i], 1 )
        A[i].date = strmid( index.date_obs,  0, 10 )
        A[i].time = strmid( index.date_obs, 11, 21 )
        A[i].seconds = (60.*minutes) + seconds
        A[i].data = data

        print, systime(/seconds) - t1 , " seconds to run " , A[i].wavelength

    endforeach

    return, A

end
