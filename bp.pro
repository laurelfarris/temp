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
    read, decision, prompt=steps[step-1] + "? "
    if decision ne '' then begin
        print, "Retall, and start over."
        STOP
    endif else return, fix(step)
    end


;; could possibly split into two blocks... or different block for each subroutine
pro create_common_vars
    COMMON bp_block, path, waves, temps, x_ref, y_ref, x_length, y_length, z_length, refs, A

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'] ;, '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    x_ref = 339 ;1300
    y_ref = 834 ;2300
    x_length = 80 ;1000
    y_length = 80 ;1000
    z_length = 300

    x_refs = [50, 49, 51, 50, 50, 49, 51, 49, 51]
    y_refs = [50, 50, 50, 49, 51, 49, 49, 51, 51]
    refs = []
    for i = 0, n_elements(x_refs)-1 do $
        refs = [ [refs], [x_refs[i], y_refs[i]] ]
    refs = refs - 10

    COMMON timelag_block, threshold
    threshold = 0.5

    end



resolve_routine, "bp_structures", /either
resolve_routine, "bp_timelag", /either
resolve_routine, "bp_graphics", /either
resolve_routine, "timelag", /either

if (step eq !NULL) then old_step = 0 else old_step = step
step = my_func(old_step)

case step of
; Create array of structures, one for each wavelength in 'waves'
    1 : create_common_vars
    2 : bp_structures
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

    5 : BP_GRAPHICS, cc, "cc"

    6 : bp_plots

endcase
end
