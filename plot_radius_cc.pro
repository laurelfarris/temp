; Filename:         graphic_configs.pro
; Last modified:    Sun 16 Apr 2017
; Programmer:       Laurel Farris
; Description:      Plots the highest correlation values as a function of
;                       distance between that pixel and the reference pixel.
;                       Use data NOT from algorithm...


pro plot_cc_vs_radius

    my_window, 600, 600

    x0 = refs[0,0]
    y0 = refs[1,0]

    threshold = []

    for i = 2, 5 do begin
        arr = A[i].cc
        r = reform( radius( arr, x0, y0 ), n_elements(arr) )
        arr = reform( arr, n_elements(arr) )
        p = scatterplot( r, arr, /current, layout=[2,2,i+1], margin=0.2 )

        for j = 0.0, 1.0, 0.1 do begin
            threshold = [threshold, n_elements( where( A[i].cc gt j ) )]

            result = HISTOGRAM( $
                A[i].cc, $
                BINSIZE=0.1, $
                ;INPUT=variable,$
                LOCATIONS=variable, $
                MAX=1.0, $
                MIN=-1.0, $
                ;NBINS=21, $
                ;OMAX=variable, $
                ;OMIN=variable, $
                ;/L64 |
                ;REVERSE_INDICES=variable $
                /NAN $
                )

            p = plot( make_array( 21, start=-1.0, /index), result )

        endfor

    endfor


end
