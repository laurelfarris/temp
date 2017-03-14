; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:      bp_read_myfits.pro, bp_align.pro, bp_run_correlation.pro, bp_graphics.pro
; Last modified:    27 February 2017
; Description:      Main program to run other bp procedures.
;                   1140, 2630 (340, 825 relative to CH)


pro bp, A, $
    read_fits=read_fits, res=res, align=align, corr=corr, graphics=graphics

    path = "/solarstorm/laurel07/Data/aia/"
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    waves = ['94','131','171','193','211','304'];,'335']

    ;; Simple reading of fits:
    ;fls = file_search(path + "*" + wave + "A*.fits")
    ;read_sdo, fls[], index, data
    ;STOP


    ;;  (1)
    ;;  Read data from fits files or from saved variables
    if keyword_set(read_fits) then begin
        resolve_routine, "bp_read_my_fits", /either
        bp_read_my_fits, A, $
            path=path, waves=waves, temps=temps, get_data=0, $
            z=300, x_ref=340+(-1), y_ref=830+(4), side=120
    endif


    ;;  (2)
    ;;  Run alignment code if needed.
    if keyword_set(align) then begin
        resolve_routine, "bp_align", /either
    endif


    ;;  (3)
    ;;  Run cross-correlation on aligned data cubes, and add data to structures.
    if keyword_set(corr) then begin
        resolve_routine, "bp_run_correlation", /either
        bp_run_correlation, A, sav=0

;        A2 = []
;        for i = 0, n_elements(A)-1 do begin
;            t1 = systime(/seconds)
;            s = A[i]
;            bp_run_correlation, s, sav=0
;            A2 = [ A2, s ]  ;; Slow...
;            print, "time: ", systime(/seconds) - t1
;        endfor
;        A = A2
    endif


    ;;  (4)
    ;;  Graphics

    if keyword_set(graphics) then begin
        resolve_routine, "bp_graphics", /either
        bp_graphics, A, $
            make_images=0, make_cc=1, make_tt=0, make_plots=0, $
            ;make_colorbar=0, $
            sav=0
    endif

end

bp, A, /graphics
end
