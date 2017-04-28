; Last modified:        24 April 2017
; Programmer:           Laurel Farris
; Description:          Input data cube, reference pixel locations, and
;                           threshold value.
; Notes:                Possible memory issues after many runs. Actual timelag
;                           should perhaps be a subroutine (as suggested by James).



BP_NO_ALGORITHM, cube, x0, y0, tau, threshold, cc_square, tt_square


    dims = size( cube, /dimensions )
    cc_square = fltarr( dims[0], dims[1] )
    tt_square = fltarr( dims[0], dims[1] )
    
    for y = 0, dims[1]-1 do begin
        for x = 0, dims[0]-1 do begin
            timelag, cube[x0, y0, *], cube[x, y, *], tau, maxcor
            cc_square[x, y] = maxcor[1]
            tt_square[x, y] = maxcor[0]
        endfor
    endfor




end
