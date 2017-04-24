; Filename:
; Last modified:    Sun 23 Apr 2017
; Programmer:       Laurel Farris
; Description:


pro plot_area, A, n_pixels

    area_arcsec = n_pixels * 0.36
    radius_arcsec = sqrt(area_arcsec/!PI)

    arcsec_to_km = 1.5e8 * tan(!PI/(180.*3600.))
    area_km = (arcsec_to_km)^2  * area_arcsec
    radius_km = sqrt(area_km/!PI)


    wavel = []
    xtickname = [ "" ]
    for i = 0, n_elements(A)-1 do begin
        wavel = [wavel, fix(A[i].wavelength)]
        xtickname = [ xtickname, A[i].wavelength ]
    endfor
    xtickname = [ xtickname, "" ]


    ;; Plot
    resolve_routine, "graphic_configs", /either
    plot_props = graphic_configs(3)
    my_window, 800,350, /del
    p = scatterplot( $
        indgen(6), $
        radius_arcsec, $
        layout=[1,1,1], $
        margin=0.15, $
        symbol="*", $
        xrange=[-1,6], $
        xtickname=xtickname, $
        xtitle='passband [$\AA$]', $
        ytitle='effective radius [arcsec]', $
        _EXTRA=plot_props )

    ;; Convert area from square pixels to square arcseconds and put on other y-axis.
    yaxis = axis( $
        'y', $
        location='right', $
        title='effective radius [km]', $
        coord_transform=[0,arcsec_to_km], $
        tickfont_size=10, $
        target=p, $
        tickdir=1 )

    save_figs, "p_area"
end
