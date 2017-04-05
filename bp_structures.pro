; Last modified:    Mon Mar 20 15:41:06 EDT 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Create structures


pro bp_structures

;    ;; Tags for each bandpass structure
;    ;tags = "w" + waves[*]

    resolve_routine, "read_my_sdo", /either

    COMMON bp_block

    x = x_length
    y = y_length
    z = z_length

    ;; initialize structures (one for each bandpass)
    substruc = { $
        wavelength : "", $
        temperature : "", $
        date : make_array(z, /string), $
        time : make_array(z, /string), $
        seconds : make_array(z, /nozero), $
        data : make_array(x, y, z, /nozero) $
        }

    ;; Assemble substructures in array
    A = replicate( substruc, n_elements(waves) )

    ;; Restore data and read headers
    foreach wave, waves, i do begin

        ;; Uses read_sdo to get header info and restores data.

        READ_MY_SDO, index, data, wave

        minutes = float( strmid( index.date_obs, 14, 2 ) )
        seconds = float( strmid( index.date_obs, 17, 5 ) )

        A[i].wavelength = strtrim( string(index[0].wavelnth), 1 )
        A[i].temperature = temps[i]
        A[i].date = strmid( index.date_obs,  0, 10 )
        A[i].time = strmid( index.date_obs, 11, 21 )
        A[i].seconds = (60.*minutes) + seconds
        A[i].data = data

    endforeach

end
