; Programmer:           Laurel Farris
; Description:          Using (aligned) data cubes,
;                           run cross-correlation and save max value, along with
;                           x and y coordinates, timelag, and distance from reference pixel
; Last modified:        25 February 2017
; Notes:                timelag.pro does appear to be producing the same results every time


pro bp_run_correlation, A, $
    sav=sav

    struc2 = []

    for i = 0, n_elements(A)-1 do begin
    ;---------------------------------------------------------------------------------------

    t1 = systime(/seconds)

    ;cube = struc.data
    cube = A[i].data

    ;; Array of possible timelags, equal to index of each successive image
    t = (size(cube))[3]
    tau = indgen(t)-(t/2)

    ;; data dimensions (width and height)
    w = (size(cube))[1]
    h = (size(cube))[2]

    ;; Center and surrounding coordinates (make this part of struc when restoring)
    ;x0 = [66]
    ;y0 = [68]
    ;x_start = 0
    ;y_start = 0
    ;x_end = w
    ;y_end = h
    ;x_start = 49
    ;y_start = 56
    ;x_end = x_start
    ;y_end = y_start

    x_ref = 60
    y_ref = 60
    x0 = [x_ref, x_ref+1, x_ref-1, x_ref, x_ref]
    y0 = [y_ref, y_ref, y_ref, y_ref+1, y_ref-1]
    ;x0 = [x_ref-radius : x_ref+radius : 1]
    ;y0 = [y_ref-radius : y_ref+radius : 1]
    n = n_elements(x0)
    cc_cube = fltarr(w, h, n, /nozero)
    tt_cube = fltarr(w, h, n, /nozero)
    rr_cube = fltarr(w, h, n, /nozero)

    resolve_routine, "timelag", /either

    ; Loop through every pixel
    for j = 0, n-1 do begin
        
        ; Loop through every other pixel in entire 2D array
        for y = 0, h-1 do begin
        for x = 0, w-1 do begin

            ;; Run timelag.pro, returns maxcor=[tt, cc]
            timelag, cube[x0[j], y0[j], *], cube[x, y, *], tau, maxcor, allcor
            cc_cube[x, y, j] = maxcor[1]
            tt_cube[x, y, j] = maxcor[0]
            rr_cube[x, y, j] = sqrt( (x0[j]-x)^2 + (y0[j]-y)^2 )

            ;plot, tau, allcor

        endfor
        endfor 

    endfor


    ;; Append cc and tt arrays to structure (A[i])
    ;struc = create_struct( struc, 'coos', [[x0], [y0]], 'cc', cc_cube, 'tt', tt_cube, 'radius', rr_cube )
    temp = create_struct( A[i], 'coos', [[x0], [y0]], 'cc', cc_cube, 'tt', tt_cube, 'radius', rr_cube )
    struc2 = [ struc2, temp ]

    if keyword_set(sav) then begin
        save, xc, yc, max_cc, max_tt, filename = path + 'cc_' + w + '.sav'
    endif

    print, "time: ", systime(/seconds) - t1
    ;---------------------------------------------------------------------------------------
    endfor
    
    A = struc2

STOP
end
