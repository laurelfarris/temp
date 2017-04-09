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



read, step, prompt="Step (" + strtrim(step,1) + "): "
;if (input eq '') then input = step else step = input
step = fix(step)

case step of
; Create array of structures, one for each wavelength in 'waves'
    1 : create_common
    2 : begin
        resolve_routine, "bp_structures", /either
        A = bp_structures()
        end
    3 : print, "alignment routine goes here"
    4 : begin
        resolve_routine, "bp_timelag", /either
        BP_TIMELAG, A, range=[0:5], algorithm=1
        end
    5 : begin 
        resolve_routine, "bp_graphics", /either
        BP_GRAPHICS, A[2:*], "tt";, blah="cc", blah="tt"
        end

    ;6 : bp_plots

endcase
;endforeach
end
