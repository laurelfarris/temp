; Last modified:        24 April 2017
; Programmer:           Laurel Farris
; Description:          Input structure, reference pixel locations, and threshold value.
;                       Append cross-correlation cube to structure.


pro BP_TIMELAG, A, threshold, x0=x0, y0=y0, s=s, algorithm=algorithm, cc_cube, tt_cube

    A2 = []

    for j = 0, n_elements(A)-1 do begin

        struc = A[j]

        ;; Cube dimensions
        cube = struc.data
        dims = size(cube, /dimensions)

        ;; Get reference locations (2xN array, centered around x0, y0)
        refs = REF_LOCS( dims, x0, y0, s )

        ;; Number of reference locations
        num_refs = (size(refs, /dimensions))[1]

        ;; Array of possible timelags
        t = dims[2]
        tau = indgen(t)-(t/2)

        ;; Map for actual cc values
        cc_cube = fltarr( dims[0], dims[1], num_refs)
        tt_cube = fltarr( dims[0], dims[1], num_refs)


        resolve_routine, "bp_no_algorithm", /either
        resolve_routine, "bp_algorithm", /either

        for i = 0, num_refs-1 do begin

            case algorithm of
                0 : BP_NO_ALGORITHM, cube, refs[0,i], refs[1,i], tau, threshold, cc_square, tt_square
                1 : BP_ALGORITHM,    cube, refs[0,i], refs[1,i], tau, threshold, cc_square, tt_square
            endcase

            cc_cube[*,*,i] = cc_square
            tt_cube[*,*,i] = tt_square

        endfor

        struc = create_struct( struc, 'cc', cc_cube, 'tt', tt_cube )
        A2 = [ A, struc ]

    endfor
    A = A2
end
