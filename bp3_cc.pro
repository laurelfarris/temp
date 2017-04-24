; Last modified:        20 April 2017
; Programmer:           Laurel Farris
; Description:          Input data cube, reference pixel locations, and
;                           threshold value.
; Notes:                Possible memory issues after many runs. Actual timelag
;                           should perhaps be a subroutine (as suggested by James).

; Choosing bandpass, bp, alg y/n, etc.
;   should be separate from routine that actually runs through the reference
;   pixels and does the timelag calculations



pro bp3_cc, cube, refs=refs, threshold=threshold, algorithm=algorithm, $
    cc_cube, tt_cube


    ;; Cube dimensions
    dims = size(cube, /dimensions)

    ;; Array of possible timelags
    t = dims[2]
    tau = indgen(t)-(t/2)

    ;; Number of reference locations
    num_refs = (size(refs, /dimensions))[1]

    ;; Map for actual cc values
    cc_cube = fltarr( dims[0], dims[1], num_refs)
    tt_cube = fltarr( dims[0], dims[1], num_refs)

    resolve_routine, "bp4_alg", /either


    ;; Calculate timelag for each reference point
    for i = 0, num_refs-1 do begin

        ;;;;; call subroutine that includes alg AND no_alg

        x0 = refs[0,i]
        y0 = refs[1,i]


        if not keyword_set(algorithm) then begin
            for x = 0, dims[0]-1 do begin
                for y = 0, dims[1]-1 do begin
                    timelag, cube[x0, y0, *], cube[x, y, *], tau, maxcor
                    cc_cube[x, y, i] = maxcor[1]
                    tt_cube[x, y, i] = maxcor[0]
                endfor
            endfor
        endif else begin
            BP4_ALG, cube, x0, y0, tau, threshold, cc_square, tt_square
            cc_cube[*,*,i] = cc_square
            tt_cube[*,*,i] = tt_square
        endelse


    endfor


end


;    d = cube[*,*,0]
;   if not keyword_set(refs) then $
;        refs = reform( array_indices(d, where(d eq max(d))), 2, 1 )

threshold = 0.5 ;; not needed without running algorithm
x0 = 50 & y0 = 50 & s = 1
map = intarr(100,100)
map[ x0-s:x0+s, y0-s:y0+s ] = 1
refs = array_indices( map, where(map eq 1) )


for i = 0, n_elements(A)-1 do begin
    BP3_CC, A[i].data, refs=refs, algorithm=1, threshold=0.5, cc, tt
    save, cc, tt, filename="bp1_" + A[i].wavelength + "_cc_center_9refs_alg.sav"
endfor

end
