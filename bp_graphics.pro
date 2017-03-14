; Filename:         bp_graphics.pro
; Last modified:    Wed 10 Mar 2017
; Programmer:       Laurel Farris
; Description:      Make all images and plots for bp project


pro bp_graphics, A,  $
    make_images=make_images, make_cc=make_cc, make_tt=make_tt, make_plots=make_plots, sav=sav

    resolve_routine, "color_tables", /either
    resolve_routine, "graphic_configs", /either

    graphic_configs, cbar_props, graphic_props, image_props

    cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]


    if keyword_set(make_images) then begin

        ;data = A.data[*,*,0,*]
        data = (A.data[30:89,30:89,0,*])^0.5
        ;data = (A.data[*,*,150,*])/max(A.data[*,*,150,*])

        image_props.min_value = min(data)
        image_props.max_value = max(data)

        cbar_props.range = [image_props.min_value, image_props.max_value]
        cbar_props.title = "intensity [counts, arbitrary]"

     endif

    threshold = 0.5

    ;; Cross-correlation
    if keyword_set(make_cc) then begin

        ;; First cc image for each wavelength
        data = A.cc[*,*,0,*]

        ;; Average of all cc images for each wavelength
        ;data = mean( A.cc, dimension=3 )
        ;data = reform( mean(A[0].cc, dimension=3), 100, 100, 1 )

        image_props.min_value = threshold
        image_props.max_value = max(data)

        rgb_table = color_tables( "CC_COLORS" )

        cbar_props.range = [image_props.min_value, image_props.max_value]
        cbar_props.title = "maximum cross-correlation"
        cbar_props.tickformat = '(F4.2)'

    endif

    ;; Timelag
    if keyword_set(make_tt) then begin

        data = A.tt[*,*,0,*]

        ;; Array of possible timelags using the observation time from fits header and
        ;; back timelags up halfway (standard procedure for cross-correlations)
        ;t = ( ( struc.time ) / 60.)
        ;t = ( ( A[i].time ) / 60.)
        ;tau = t - (max(t)/2.)

        ;; Cut off timelag for cc values less than threshold
        data[ where( A.cc[*,*,0,*] lt threshold ) ] = -10000.0

        rgb_table = colortable( [[wh],[rd],[ye],[bl],[wh]], $
                indices=[0,1,128,254,255], stretch=[0,10,-10,0] )

        ;image_props.min_value = round( min(A.tt))
        image_props.min_value = -150
        image_props.max_value = 150

        cbar_props.range = [image_props.min_value, image_props.max_value]
        cbar_props.title = "timelag [minutes]"
        ;cbar_props.title = "timelag [cadence]"

     endif

    ;; Create all images in window
    wy = 828
    wx = wy * (8.5/11.0)
    w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

    props = create_struct(graphic_props, image_props)

    im = objarr(6)
    n = (size(data))[3]
    for i = 0, n-1 do begin
        im[i] = image( data[*,*,i], $
            name = "w" + strtrim( A[i].wavelength ), $
            ;position = [ x[i], y[i], x[i] + side, y[i] + side], $
            layout = [2,3,i+1], $
            margin = 0.1, $
            title = A[i].title, $
            rgb_table = rgb_table, $
            _EXTRA = props )
        if i mod 2 eq 1 then im[i].position = im[i].position - [0.08, 0, 0.08, 0]
    endfor
    cbar = colorbar( _EXTRA = cbar_props )


    ;; Plots

    if keyword_set(make_plots) then begin

        ;; Axis labels
        labels = [ $
            'radius [pixels]', $
            'radius [arcseconds]', $
            'radius [km]', $
            'intensity [counts, arbitrary]', $
            'maximum cross-correlation', $
            'timelag [cadence]', $
            'timelag [minutes]' ]


        x_data = A.radius[*,*,0,*]
        xlabel = labels[0]

        ;y_data = mean(A.cc, dimension=3)
        y_data = A.cc[*,*,0,*]
        ylabel = labels[4]

        plot_properties = { $
                ;xrange = [0, max(x_data)], yrange = [0, max(y_data)], $
                ;aspect_ratio = , $
                symbol     : 'dot', $
                sym_filled : 1, $
                sym_size   : 1.0 $
                }

        props = create_struct( graphic_properties, plot_properties )

        p = objarr(6)
        n = n_elements(A)
        for i = 0, n-1 do begin

            p[i] = scatterplot( reform(x_data[*,*,i],120^2), reform(y_data[*,*,i],120^2), $
                ;magnitude = A[i].tt[*,*,0,*], $
                layout = [2,3,i+1], $
                ;name = "w" + strtrim( A[i].wavelength ), $
                margin=0.1, $
                title = A[i].title, $
                _EXTRA = props $
                )
        endfor
        if i mod 2 eq 1 then p[i].position = p[i].position - [0.08, 0, 0.08, 0]
        cbar = colorbar( _EXTRA = cbar_properties )

    endif


    ;; Save graphic
    if keyword_set(sav) then begin
        b = ''
        read, b, prompt="Save figure (y/n)? "
        if b eq "y" then begin
            fname = ''
            read, fname, prompt="Enter file name to save: "
            p.save, "Figures/" + fname, resolution=300
        endif
    endif
STOP
w.close
end
