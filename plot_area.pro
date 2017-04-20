; Filename:         graphic_configs.pro
; Last modified:    Sun 16 Apr 2017
; Programmer:       Laurel Farris
; Description:      Make lightcurves and cc plots for example to explain cc concept.


pro bp_plot_area

    area = []
    wavel = []

    ;; Write code to keep track of number of pixels filled in by timelag codes.
    for i = 2, 5 do begin
        area = [area, n_elements( where( A[i].cc_alg ne 0.0 ) )]
        wavel = [wavel, fix(A[i].wavelength)]
    endfor


    ;; Plot
    xtickname = [ "", A[2:*].wavelength, "" ]  ;; ????
    p = scatterplot( $
        indgen(4), $
        area, $
        symbol="*", $
        xtickname=xtickname, $
        xtitle='bandpass [Angstroms]', $
        ytitle='area [arcsec$^{2}$]', $
        sym_size=2, $
        _EXTRA=plot_props )

    ;; Convert area from square pixels to square arcseconds and put on other y-axis.
    yaxis = axis( $
        'y', $
        location='right', $
        title='area [arcsec$^{2}$]', $
        coord_transform=[0,0.36], $
        tickfont_size=10, $
        target=p, $
        tickdir=1 )
end
