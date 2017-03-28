; Filename:         bp_scatterplots.pro
; Last modified:    14 March 2017
; Programmer:       Laurel Farris
; Description:      Make all images and plots for bp project




;if keyword_set(make_plots) then begin
pro bp_scatterplots

    resolve_routine, "graphic_configs", /either

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

end
;endif


resolve_routine, "color_tables", /either
resolve_routine, "graphic_configs", /either

graphic_configs, cbar_props, graphic_props, image_props, scatterplot_properties

cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]

end
