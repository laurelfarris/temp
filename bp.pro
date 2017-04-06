; Last modified:    Wed Apr 05
; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:
; Description:      Main program to run bp procedures.


;if (step eq !NULL) then old_step = 0 else old_step = step
;step = my_func(old_step)

function my_func, old_step
    step = ''
    read, step, prompt="Enter step (" + strtrim(old_step,1) + "): "
    steps = ["Call common", "Read fits", "Align", "Timelag", "Graphics"]
    decision = ''
    read, decision, prompt=steps[step-1] + "? "
    if decision ne '' then begin
        print, "Retall, and start over."
        STOP
    endif else return, fix(step)
    end


pro create_common

    ;; Common block should include any variables that may need to be changed during
    ;; the course of the project, or for the next project, while the subroutines should
    ;; be able to be used as they are for a different project.

    COMMON bp_block, $
        path, waves, temps, x_ref, y_ref, x_dim, y_dim, z_dim, refs, threshold

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'] ;, '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    x_ref = 339 ;1300
    y_ref = 834 ;2300
    x_dim = 80 ;1000
    y_dim = 80 ;1000
    z_dim = 300
    refs = [[40,40],[39,40],[41,40],[40,39],[40,41],[39,39],[41,39],[39,41],[41,41]]
    threshold = 0.5
end


resolve_routine, "bp_structures", /either
resolve_routine, "bp_timelag", /either
resolve_routine, "bp_graphics", /either

;foreach step, steps do begin
case step of
; Create array of structures, one for each wavelength in 'waves'
    1 : create_common
    2 : A = bp_structures()
    3 : print, "alignment routine goes here... maybe"
    4 : begin
        cc = [] & tt = []
        for i = 0, n_elements(A)-1 do begin
            BP_TIMELAG, A[i].data, algorithm=1, cc_cube, tt_cube
            cc_avg = mean( cc_cube, dimension=3 )
            cc = [ [[cc]], [[cc_avg]] ]
            tt = [ [[tt]], [[tt_cube[*,*,0]]] ]
        endfor
        end

    5 : BP_GRAPHICS, A, "im"
    6 : BP_GRAPHICS, A, "cc"
    7 : BP_GRAPHICS, A, "tt"

    ;6 : bp_plots

endcase
;endforeach
step = !NULL
end
