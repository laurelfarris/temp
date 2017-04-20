
FUNCTION radius, arr, x0, y0

    dims = size( arr, /dimensions )
    locs = indgen( n_elements(arr) ) ;; unecessary variable, but keeps things less messy
    ind = float( array_indices( arr, locs ) )

    rad = fltarr( n_elements(arr) )
    for i = 0, n_elements(arr)-1 do begin
        x = ind[0,i] & y = ind[1,i]
        rad[i] = sqrt( (x0-x)^2 + (y0-y)^2 )
    endfor

    return, reform(rad, dims[0], dims[1])


END
