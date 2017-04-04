; Last modified:    Wed Mar 29
; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:
; Description:      Main program to run bp procedures.


pro create_common_vars
    COMMON bp_block, path, waves, temps, x_ref, y_ref, x, y, z

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'] ;, '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    x_ref = 339 ;1300
    y_ref = 834 ;2300
    x = 100 ;1000
    y = 100 ;1000
    z = 300
    end



;pro bp_routine, A, steps=steps
foreach step, steps do begin
    case step of
    ; Create array of structures, one for each wavelength in 'waves'
        1 : create_common_vars
        2 : begin
                resolve_routine, "structures", /either
                resolve_routine, "read_my_sdo", /either
                A = STRUCTURES()
            end
        3 : print, "alignment placeholder"
        4 : begin
                ;resolve_routine, "bp_timelag", /either
                x_refs = [50, 49, 51, 50, 50, 49, 51, 49, 51]
                y_refs = [50, 50, 50, 49, 51, 49, 49, 51, 51]
                refs = []
                for i = 0, n_elements(x_refs)-1 do $
                    refs = [ [refs], [x_refs[i], y_refs[i]] ]
                STOP
                c1 = BP_TIMELAG( A[3].data, refs=refs[0:3], threshold=0.5 )
                c2 = BP_TIMELAG( A[3].data, refs=refs[4:*], threshold=0.5 )
                c = mean( [ [[c1]], [[c2]] ], dimension=3 )
            end
        5 : begin
                ;; Compile and call prodecdure to get graphic properties to apply during creation.
                resolve_routine, "graphic_configs", /either
                GRAPHIC_CONFIGS  ;; cbar_properties, image_properties, scatter_properties
                
                resolve_routine, "bp_prep_graphics", /either
                resolve_routine, "bp_make_graphics", /either

            end
    endcase
endforeach


; PROBLEM: After error, get stuck in routine and this statement doesn't execute.
steps = !NULL

; Run cross-correlations and create new structure for each wavelegth
;   (this way can run timelag on a single wavelength if desired... can take a long time).
;c94 = BP_TIMELAG( A[0].data )
;c131 = BP_TIMELAG( A[1].data )
;c171 = BP_TIMELAG( A[3].data )
;c193 = BP_TIMELAG( A[3].data )
;c211 = BP_TIMELAG( A[4].data )
;c304 = BP_TIMELAG( A[5].data )
end
