; Last modified:    Wed Apr 05
; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:
; Description:      Main program to run bp procedures.


function my_func, old_step
    step = ''
    read, step, prompt="Enter step (" + strtrim(old_step,1) + "): "
    steps = ["Call common", "Read fits", "Align", "Timelag", "Graphics"]
    decision = ''
    read, decision, prompt=steps[step-1] + " (y/n)? "
    if decision ne "y" then begin
        print, "Retall, and start over."
        STOP
    endif else return, fix(step)
    end


pro create_common_vars
    COMMON bp_block, path, waves, temps, x_ref, y_ref, x, y, z

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'] ;, '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    x_ref = 339 ;1300
    y_ref = 834 ;2300
    x = 80 ;1000
    y = 80 ;1000
    z = 300
    end


if (step eq !NULL) then oldstep = 1 else old_step = step
step = my_func(old_step)


case step of
; Create array of structures, one for each wavelength in 'waves'
    1 : create_common_vars
    2 : begin
            resolve_routine, "structures", /either
            resolve_routine, "read_my_sdo", /either
            A = STRUCTURES()
        end
    3 : print, "alignment routine goes here... maybe"
    4 : begin

        resolve_routine, "bp_timelag", /either
        x_refs = [50, 49, 51, 50, 50, 49, 51, 49, 51]
        y_refs = [50, 50, 50, 49, 51, 49, 49, 51, 51]
        refs = []
        for i = 0, n_elements(x_refs)-1 do $
            refs = [ [refs], [x_refs[i], y_refs[i]] ]
        refs = refs - 10

        cc = []
        for i = 0, n_elements(A)-1 do begin
            BP_TIMELAG, A[i].data, refs, 0.5, cc, tt
            cc_avg = mean( cc_cube, dimension=3 )
            cc = [ [[cc]], [[cc_avg]] ]
        endfor
        cc_norm = cc/max(cc)

        BP_TIMELAG, A[0].data, refs, 0.5, cc94, tt94
        cc_avg94 =  mean( cc94, dimension=3 )
        BP_TIMELAG, A[1].data, refs, 0.5, cc131, tt131
        cc_avg131 =  mean( cc131, dimension=3 )
        BP_TIMELAG, A[2].data, refs, 0.5, cc171, tt171
        cc_avg171 =  mean( cc171, dimension=3 )
        BP_TIMELAG, A[3].data, refs, 0.5, cc193, tt193
        cc_avg193 =  mean( cc193, dimension=3 )
        BP_TIMELAG, A[4].data, refs, 0.5, cc211, tt211
        cc_avg211 =  mean( cc211, dimension=3 )
        BP_TIMELAG, A[5].data, refs, 0.5, cc304, tt304
        cc_avg304 =  mean( cc304, dimension=3 )

        cc_block = [ $
            [[cc_avg94]], $
            [[cc_avg131]], $
            [[cc_avg171]], $
            [[cc_avg193]], $
            [[cc_avg211]], $
            [[cc_avg304]] ]

        end
    5 : begin
        resolve_routine, "bp_graphics", /either
        BP_GRAPHICS, A, cc_block, "cc"
        end

endcase
end
