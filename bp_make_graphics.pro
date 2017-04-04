; Programmer:       Laurel Farris
; Filename:         bp_images.pro
; Subroutines:      bp_read_myfits.pro, bp_align.pro, bp_run_correlation.pro, bp_graphics.pro
; Last modified:    14 March 2017
; Description:      Creates window and graphics based on data and structures
;                       returned from bp_graphic_properties.pro



pro bp_make_graphics, data

    common graphic_block

    ;; Window
    wy = 828
    wx = wy * (8.5/11.0)
    w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

            time_str = strtrim( round(time), 1 )
            wave_str = "$\lambda$=" + strtrim( string(index[0].wavelnth), 1 ) + " $\AA$"
            temp_str = "log(T)=" + temps[i] + " K"


    ;; Images (inside current window)
    n = (size(data, /dimensions))[2]
    im = objarr(n)
    for i = 0, n-1 do begin
        im[i] = image( data[*,*,i], $
            name = "w" + strtrim( A[i].wavelength ), $
            ;position = [ x[i], y[i], x[i] + side, y[i] + side], $
            layout = [2,3,i+1], $
            margin = 0.1, $
            title = "$\lambda$=" + A[i].wavelength + " $\AA$; log(T)=" + A[i].temperature + "K", $
            xtitle = "x [pixels]", $
            ytitle = "y [pixels]", $
            _EXTRA = props )
        if i mod 2 eq 1 then im[i].position = im[i].position - [0.08, 0, 0.08, 0]
    endfor

    ;; Colorbar
    ;cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]
    ;cbar = colorbar( _EXTRA = cbar_props )

end
