; Last modified:        20 April 2017
; Programmer:           Laurel Farris
; Description:          run timelag.pro with algorithm or without


pro BP_ALG, cube, x0, y0, threshold, cc_square, tt_square


        dims = size(cube, /dimensions)
        map = intarr( dims[0], dims[1] )
        map[x0,y0] = 75
        map[x0, y0-1] = 1
        map[x0, y0+1] = 1
        map[x0-1, y0] = 1
        map[x0+1, y0] = 1

        cc_square = fltarr( dims[0], dims[1] )
        tt_square = fltarr( dims[0], dims[1] )

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
                cc_square[x,y] = maxcor[1]
                tt_square[x,y] = maxcor[0]

                ; Set map[locations of immediate neighbors] = 1
                locs = [ [x-1,y], [x+1,y], [x,y-1], [x,y+1] ]
                map[ locs[0,*], locs[1,*] ] = map[ locs[0,*], locs[1,*] ] > 1

            endif else map[ x, y ] = 20

            ind_1D = where( map eq 1 )

            ;; Hacky way to determine whether any 1's are left.
            if ( (size(ind_1D))[0] eq 0 ) then break


        endwhile


end
