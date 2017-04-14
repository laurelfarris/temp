pro make_lightcurves, props, A

        
    d1 = reform(A[3].data[40,40,*])
    d2 = reform(A[3].data[40,43,*])
    d3 = reform(A[3].data[5,5,*])

    t = indgen(300)
    tau = t-150
    timelag, d1, d2, tau, maxcor2, c2
    timelag, d1, d3, tau, maxcor3, c3

    d1 = d1/max(d1)
    d2 = d2/max(d2) + 0.75
    d3 = d3/max(d3) + 1.50

    p1 = plot( t, d1, layout=[1,2,1], margin=0.15, $
        yrange=[0,3], $
        xtitle = "image (12-second cadence)", ytitle = "intensity (normalized)", $
        _EXTRA=props )
    p2 = plot( t, d2, /overplot )
    p3 = plot( t, d3, /overplot )
    xaxis = axis('x', location='top', $
        title="time [minutes]", coord_transform=[0, 0.2], $
        tickfont_size=10, $
        tickdir=1 )

    p = plot( tau, c2, layout=[1,2,2], margin=0.15, $
        xrange=[min(tau), max(tau)], $
        yrange=[-1.0, 1.0], $
        xtitle = "timelag", ytitle = "cross-correlation", $
        _EXTRA=props )
    p = plot( tau, c3, /overplot )
    xaxis = axis('x', location='top', $
        title="time [minutes]", coord_transform=[0, 0.2], $
        tickfont_size=10, $
        target=p, $
        tickdir=1 )

    text_props = { $
        font_size : 10, $
        data      : 1  }
    tx = 25
    text = TEXT( tx, 0.6, "(a)", _EXTRA=text_props)
    text = TEXT( tx, 1.2, "(b)", _EXTRA=text_props)
    text = TEXT( tx, 2.0, "(c)", _EXTRA=text_props)

end


PRO plot_cc_vs_radius

    ;; Window
    if (getwindows('plot')) then w.close
    wx = 600
    wy = 600
    w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

    ;make_lightcurves, props, A

    x0 = refs[0,0]
    y0 = refs[1,0]

    for i = 2, 5 do begin
        arr = A[i].cc
        r = reform( radius( arr, x0, y0 ), n_elements(arr) )
        arr = reform( arr, n_elements(arr) )
        p = scatterplot( r, arr, /current, layout=[2,2,i+1], margin=0.2 )
    endfor
end


PRO plot_cc_example

    tau = indgen(n) - n/2.
    timelag, y1, y2, tau, maxcor, c

    p1 = plot( x, y1, layout=[1,2,1], margin=0.2, $
        xtitle = "x", $
        ytitle = "f(x)", $
        color="blue", $
        _EXTRA=plot_props )

    p2 = plot( x, y2, /overplot, $
        color="red" )

    ;x = x - (max(x))/2
    p3 = plot( x, c, layout=[1,2,2], margin=0.2, $
        ;xmajor = 10, $
        xtitle = "lag", $
        ytitle = "cross-correlation", $
        _EXTRA=plot_props )

    pos = 0.1
    p3.position = p3.position + [0, pos, 0, pos]

    t1 = text(0.9, 0.8, "(a)", color="blue")
    t2 = text(0.9, 0.7, "(b)", color="red")

    filename = "pl_ccExample"
END


PRO plot_area_vs_wave
    area = []
    wavel = []
    for i = 2, 5 do begin
        area = [area, n_elements( where( A[i].cc_alg ne 0.0 ) )]
        wavel = [wavel, fix(A[i].wavelength)]
    endfor

    area = area * 0.36

    ;; Plot
    xtickname = [ "", A[2:*].wavelength, "" ]
    p = scatterplot( indgen(4), area, symbol="*", xtickname=xtickname, $
        sym_size=2, $
        _EXTRA=plot_props )
END
