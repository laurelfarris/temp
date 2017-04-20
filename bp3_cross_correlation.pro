; Last modified:        05 April 2017
; Programmer:           Laurel Farris
; Description:          Input data cube, reference pixel locations, and
;                           threshold value.
; Notes:                Possible memory issues after many runs. Actual timelag
;                           should perhaps be a subroutine (as suggested by James).

; Choosing bandpass, bp, alg y/n, etc.
;   should be separate from routine that actually runs through the reference
;   pixels and does the timelag calculations



algorithm=0
algorithm=1

;; CBP number ( 0 = original )
bb = 0

;; Bandpass/wavelength
ww = 3

;; Data
bp1_x = bps[0,bb] & bp1_y = bps[1,bb]
len = 40
cube = A[ww].data[ bp1_x-len : bp1_x+len-1 , bp1_y-(len/2) : bp1_y+(len/2)-1 , *]
dims = size(cube, /dimensions)

;; Timelag
resolve_routine, "timelag", /either
refs = [[40,40],[39,40],[41,40],[40,39],[40,41],[39,39],[41,39],[39,41],[41,41]]
threshold = 0.5
t = 300
tau = indgen(t)-(t/2)

; Number of reference locations
num_refs = (size(refs, /dimensions))[1]

;; Map for actual cc values (greater than threshold)
cc_cube = fltarr( dims[0], dims[1], num_refs)
tt_cube = fltarr( dims[0], dims[1], num_refs)

;; Loop through every reference location.
for i = 0, num_refs-1 do begin

    x0 = refs[0,i]
    y0 = refs[1,i]


;; Algorithm (should be its own subroutine, like timelag itself.)
;;   Still should use every pixel as a reference? More than 3x3 at least?

            if ( algorithm eq 1 ) then begin

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
                        cc_cube[x,y,i] = maxcor[1]
                        tt_cube[x,y,i] = maxcor[0]
                        ; Set map[locations of immediate neighbors] = 1
                        locs = [ [x-1,y], [x+1,y], [x,y-1], [x,y+1] ]
                        map[ locs[0,*], locs[1,*] ] = map[ locs[0,*], locs[1,*] ] > 1
                    endif else map[ x, y ] = 20

                    ind_1D = where( map eq 1 )
                    ;; Hacky way to determine whether any 1's are left.
                    if ( (size(ind_1D))[0] eq 0 ) then break

                endwhile
                A[j].cc_alg = mean( cc_cube, dimension=3 )
                A[j].tt_alg = tt_cube[*,*,0]

;; No algorithm
            endif else begin
                for x = 0, dims[0]-1 do begin
                    for y = 0, dims[1]-1 do begin
                        timelag, cube[x0, y0, *], cube[x, y, *], tau, maxcor
                        cc_cube[x, y, i] = maxcor[1]
                        tt_cube[x, y, i] = maxcor[0]
                    endfor
                endfor
                A[j].cc = mean( cc_cube, dimension=3 )
                A[j].tt = tt_cube[*,*,0]
            endelse

        endfor ;; x0[i], y0[i]


end
