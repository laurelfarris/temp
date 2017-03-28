; Programmer:           Laurel Farris
; Description:          Using (aligned) data cubes,
;                           run cross-correlation and save max value, along with
;                           x and y coordinates, timelag, and distance from reference pixel
; Last modified:        16 December 2016


pro bp_brief_correlation, A, sav=sav


    A2 = []
    
    for i = 0, n_elements(A)-1 do begin

        cube = A[i].data

        ;; Array of possible timelags using number of images and
        ;; back timelags up halfway (standard procedure for cross-correlations)
        ;t = (size(cube))[3]
        ;tau = indgen(t)-(t/2)

        ;; Array of possible timelags using the observation time from fits header and
        ;; back timelags up halfway (standard procedure for cross-correlations)
        t = ( ( A.(i).time ) / 60.)
        tau = t - (max(t)/2.)

        ;; data dimensions (width and height)
        w = (size(cube))[1]
        h = (size(cube))[2]

        ;; Center and surrounding coordinates (make this part of struc when restoring)
        xc = w/2 & yc = h/2
        x0 = [xc, xc+1, xc-1, xc, xc]
        y0 = [yc, yc, yc, yc+1, yc-1]

        n = n_elements(x0)

        cc_cube = fltarr(w, h, n, /nozero)
        tt_cube = fltarr(w, h, n, /nozero)
        rr_cube = fltarr(w, h, n, /nozero)

        cc_cube[*,*,0] = A[i].cc
        tt_cube[*,*,0] = A[i].tt
        rr_cube[*,*,0] = A[i].radius


        resolve_routine, "timelag", /either

        ; Loop through every pixel
        for j = 1, n-1 do begin
            
            ; Loop through every other pixel in entire 2D array
            for y = 0, h-1 do begin
            for x = 0, w-1 do begin
                ;; Run timelag.pro, returns maxcor=[tt, cc]
                timelag, cube[x0[j], y0[j], *], cube[x, y, *], tau, maxcor
                cc_cube[x, y, j] = maxcor[1]
                tt_cube[x, y, j] = maxcor[0]
                rr_cube[x, y, j] = sqrt( (x0[j]-x)^2 + (y0[j]-y)^2  )
            endfor
            endfor 
        endfor

        temp = create_struct( A[i], $
            'coos', [[x0], [y0]], $
            'cc', cc_cube, 'tt', tt_cube, 'radius', rr_cube )

        A2 = [A2, temp]

    endfor

    A = A2


    ;; Append cc and tt arrays to structure (A[i])
    ;struc = create_struct( $
    ;    struc, 'coos', [[x0], [y0]], $
    ;    'cc', cc_cube, 'tt', tt_cube, 'radius', rr_cube )

    if keyword_set(sav) then begin
        save, xc, yc, max_cc, max_tt, filename = path + 'cc_' + w + '.sav'
    endif

    finish = systime(/seconds)
    print, "Runtime = ", finish-start, " seconds"

end
