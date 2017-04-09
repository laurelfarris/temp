
FUNCTION radius, A, x0, y0

    dims = size( A, /dimensions )
    locs = where( A eq A )
    rad = fltarr( n_elements(locs) )
    ind = float(array_indices( A, locs ))

    for i = 0, n_elements(locs)-1 do begin
        x = ind[0,i] & y = ind[1,i]
        rad[i] = sqrt( (x0-x)^2 + (y0-y)^2 )
    endfor

    return, reform(rad, dims[0], dims[1])


END
