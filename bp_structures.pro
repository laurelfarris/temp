; Last modified:    06 April 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Read/restore data and headers, and create array of structures,
;                       one for each bandpass.


function bp_structures


    COMMON bp_block
    x = x_dim
    y = y_dim
    z = z_dim

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
    resolve_routine, "read_my_sdo", /either
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

    return, A

end
