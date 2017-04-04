; Last modified:        02 April 2017
; Programmer:           Laurel Farris
; Description:          Input data cube, reference pixel locations, and threshold value.
;                       Returns 
; Notes:


function bp_timelag, cube, refs=refs, threshold=threshold

    resolve_routine, "timelag", /either

    ;; dimensions
    dims = size(cube, /dimensions)

    ;; Array of possible timelags, equal to index of each successive image
    t = dims[2]
    tau = indgen(t)-(t/2)

    ; Number of reference locations
    num_refs = (size(refs, /dimensions))[1]

    ;; Map for actual cc values (greater than threshold)
    cc_map = fltarr( dims[0], dims[1], num_refs)


    ;; Loop through every reference location, starting at the "center".
    for i = 0, num_refs-1 do begin

        x0 = refs[0,i]
        y0 = refs[1,i]

        ; initialize map of locations to test
        map = intarr( dims[0], dims[1] )
        map[x0,y0] = 75
        map[x0, y0-1] = 1
        map[x0, y0+1] = 1
        map[x0-1, y0] = 1
        map[x0+1, y0] = 1

        ind_1D = where( map eq 1 )


        ;; Run timelag on (x0,y0) until no more locations are left.
        while 1 do begin

            ; Convert to 2D index array for more intuitive access
            ind_2D = array_indices( map, ind_1D )
            x = ind_2D[0,0]
            y = ind_2D[1,0]

            timelag, cube[x0,y0,*], cube[x,y,*], tau, maxcor

            if (maxcor[1] ge threshold) then begin
                map[x,y] = 100
                cc_map[x,y,i] = maxcor[1]
                ; Set map[locations of immediate neighbors] = 1
                locs = [ [x-1,y], [x+1,y], [x,y-1], [x,y+1] ]
                map[ locs[0,*], locs[1,*] ] = map[ locs[0,*], locs[1,*] ] > 1
            endif else map[ x, y ] = 20
           
            ind_1D = where( map eq 1 )
            ;; Hacky way to determine whether any 1's are left.
            if ( (size(ind_1D))[0] eq 0 ) then break

        endwhile

    endfor

    return, cc_map

end
