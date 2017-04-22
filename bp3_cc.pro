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


    d = cube[*,*,0]
    if not keyword_set(refs) then refs = array_indices( d, where( d eq max(d) ) )

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


    ;; Calculate timelag for each reference point
    for i = 0, num_refs-1 do begin

        ;;;;; call subroutine that includes alg AND no_alg

        x0 = refs[0,i]
        y0 = refs[1,i]

        case algorithm of

        0 : begin
            for x = 0, dims[0]-1 do begin
                for y = 0, dims[1]-1 do begin
                    timelag, cube[x0, y0, *], cube[x, y, *], tau, maxcor
                    cc_cube[x, y, i] = maxcor[1]
                    tt_cube[x, y, i] = maxcor[0]
                endfor
            endfor
        end

        1 : begin
            BP_ALG, cube, x0, y0, threshold, cc_square, tt_square
            cc_cube[*,*,i] = cc_square
            tt_cube[*,*,i] = tt_square
        end

        endcase

    endfor


end

; Extra locations to calculate cc
refs = [[50,50],[49,50],[51,50],[50,49],[50,51],[49,49],[51,49],[49,51],[51,51]]
threshold = 0.5 ;; not needed without running algorithm

for i = 0, n_elements(A)-1 do begin
    BP3_CC, A[i].data, algorithm=0, cc_cube, tt_cube 
    save, cc_cube, filename="bp1_" + A[i].wavelength + "_cc_05.sav"
    save, tt_cube, filename="bp1_" + A[i].wavelength + "_tt_05.sav"
endfor

end
