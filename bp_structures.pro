; Last modified:    Mon Mar 20 15:41:06 EDT 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Create structures


function BP_STRUCTURES

;    ;; Tags for each bandpass structure
;    ;tags = "w" + waves[*]

    ;SELECT_WAVES, indgen(6), waves, temps
    COMMON bp_block



    ;; initialize structures (one for each bandpass)
    substruc = { $
        wavelength : "", $
        temperature : "", $
        date : make_array(z, /nozero), $
        time : make_array(z, /nozero), $
        data : make_array(x, y, z, /nozero) $
        }

    ;; Assemble substructures in array
    A = replicate( substruc, n_elements(waves) )

    ;; Restore data and read headers
    resolve_routine, "read_my_sdo", /either

    foreach wave, waves, i do begin

        READ_MY_SDO, index, data, wave=wave

        A[i].wavelength = strtrim( string(index[0].wavelnth), 1 )
        A[i].temperature = temps[i]
        A[i].date = strmid( index.date_obs, 0, 9 )
        A[i].time = strmid( index.date_obs, 17, 5 ) + 60.*strmid(index.date_obs, 14, 2)
        A[i].data = data

    endforeach

    return, A
end
