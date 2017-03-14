; Filename:         bp_graphics.pro
; Last modified:    13 February 2017
; Programmer:       Laurel Farris
; Description:      Make all images and plots for bp project


pro bp_graphics, A, buffer=buffer, $
    make_plots=make_plots, make_images=make_images, j=j, make_colorbar=make_colorbar, sav=sav


    ;; graphics window, scaled to size of a sheet of computer paper
    wy = 828 & wx = wy * (8.5/11.0)
    ;w = window( dimensions=[wx, wy], location=[0, 0], buffer=buffer )
    image_window = window( dimensions=[wx, wy], location=[0, 0], /buffer )
    plot_window = window( dimensions=[wx, wy], location=[0, 0], /buffer )

    N = n_elements(A)
    cols = ( (N-1) mod 2) + 1  &  rows = N/cols
    gap = 50. ;space between and around each graphic
    side = (wy - (gap * (rows+1))) / rows
    x = (indgen(N)  /  rows) * (side + gap) + gap
    y = (indgen(N) mod rows) * (side + gap) + gap


    fontsize = 8 & fontname = "Helvetica"


    ;; Colors

    bk = [000,000,000]
    wh = [255,255,255]
    rd = [204,000,000]
    og = [255,128,000]
    ye = [255,255,000]
    gr = [000,153,000]
    lg = [102,255,102]
    cy = [000,153,153]
    bl = [000,000,204]
    pr = [148,000,211]
    in = [075,000,130]

    color_table = { $
        im_colors: 0, $
        cc_colors1: colortable( [[wh], [bk]] ), $
        cc_colors2: colortable( [[wh], [rd], [og], [ye], [gr], [bl], [pr]]), $
        tt_colors: colortable([ [wh], [rd], [ye], [bl], [wh] ], $
            indices=[0, 1, 128, 254, 255], stretch=[0, 10, -10, 0] ), $
        plot_colors: colortable([ [rd], [0,0,0], [bl] ]) }

    ;; Create structure of data cubes (images, cc images, and tt_images)
    d = { $
        im_data: (A[*].data[*,*,0])^0.5, $
        cc_data: A[*].cc[*,*,0], $
        tt_data: A[*].tt[*,*,0] }

    ;; Cut off timelag for cc values less than threshold
    threshold = 0.5  ; or 3sigma... ???
    d.tt_data[ where(d.cc_data lt threshold) ] = -10000.0

    ;; Min/max values to plot for each data cube
    data_range = [ $
        [0,   max(d.im_data)], $
        [0.5, max(d.cc_data)], $
        [min(d.tt_data), round(max(d.tt_data))], $
        [-150, 150] ]

    if keyword_set(make_images) then begin

        image_window.SetCurrent
    
        xlabel = 'x [pixels]'
        ylabel = 'y [pixels]'

        graphic_properties = { $
            current: 1, device: 1, axis_style: 2, $
            font_size: fontsize, $
            xtickdir: 0, xticklen: 0.03, xminor: 5, $
            ytickdir: 0, yticklen: 0.03, yminor: 5, $
            xtickfont_size: fontsize, ytickfont_size: fontsize, $
            position : [], $
            title:" ", $
            ;min_value: data_range[0,j], $
            ;max_value: data_range[1,j], $
            rgb_table: color_table.(j) $
            }

        for i = 0, n_elements(A)-1 do begin

            graphics_properties.position = [ x[i], y[i], x[i] + side, y[i] + side]
            graphics_properties.title = "$\lambda$ = " + strtrim(string(A[i].wavelength), 1) + $
                " $\AA$, log(T) = " + A[i].temperature + " K"

            p = image( d.(j)[*,*,i],  _EXTRA=graphic_properties )

        endfor
    ;endif


    if keyword_set(make_plots) then begin

        plot_window.SetCurrent
    
        ;; Axis labels
        labels = [ $
            'radius [pixels]', $
            'radius [arcseconds]', $
            'radius [km]', $
            'intensity [counts, arbitrary]', $
            'maximum cross-correlation', $
            'timelag [cadence units]', $
            'timelag [minutes]' ]

        xlabel = labels[4]
        ylabel = labels[2]


        for i = 0, n_elements(A)-1 do begin

            ;r = A[i].radius
            ;c = A[i].cc_im
            ;t = A[i].tt_im

            ; Scale timelag by 1/3 ;; or use some array manipulation to sort, then cut
            ;r = r[where(abs(t) le 50)] ;c = c[where(abs(t) le 50)] ;t = t[where(abs(t) le 50)]

            ;x_data = r
            ;x_data = t[where(c ge 0.5)]
            ;y_data = c[where(c ge 0.5)]


            x_data = reform(d.tt_data[i])
            y_data = reform(d.cc_data[i])
            ;x_data = array_indices( y_data, where(y_data eq y_data) )
            x_r = abs(max(x_data) - min(x_data))
            y_r = abs(max(y_data) - min(y_data))

            p = scatterplot(x_data, y_data, $
;                aspect_ratio = (x_r)/(y_r), $
;                magnitude = t, $
                position = [ x[i], y[i], x[i] + side, y[i] + side], $
                symbol='dot', sym_filled = 1, sym_size = 1.0, $
                ;xrange = [0, max(x_data)], yrange = [0, max(y_data)], $
                title="$\lambda$ = " + strtrim(string(A[i].wavelength), 1) + $
                    " $\AA$, log(T) = " + A[i].temperature + " K", $
                _EXTRA = graphic_properties $
                )


;-----------------------------------------------------;
; The purpose of this code is to plot the brightness
; of a bright point as function of radial distance away
; from the bright point.

; Values needed from data cube
;t = (size(cube))[3]
;tau = indgen(t)-(t/2)
;pixels = (size(cube))[1]
;
;; Pixel coordinates for bp1
;x = 240
;y = 1730
;
;; 'radius'
;r = 50
;
;; open file for writing
;file = 'size.dat'
;openw, mylun, /get_lun, file
;
;for x0 = (x-r),(x+r) do begin
;for y0 = (y-r),(y+r) do begin
;    d = sqrt( (x-x0)^2 + (y-y0)^2)
;    intensity = cube[x0,y0,0]
;    printf, mylun, d, intensity
;endfor
;endfor
;
;
;free_lun, mylun
;
;end
;
;-----------------------------------------------------;

        endfor
    endif


    ;; Colorbar
    if keyword_set(make_colorbar) then begin

        cbar_title = [ $
            "intensity [counts, arbitrary]", $
            "maximum cross-correlation", $
            "timelag [minutes]" , $
            "timelag [cadence units]" ]

        cx1 = x[-1] + side + 0.5*gap
        cy1 = gap
        cx2 = cx1 + 0.5*gap
        cy2 = y[-1] + side


        cbar_properties = { $

        cbar = colorbar( $
            orientation=1, /device, $
            position=[cx1, cy1, cx2, cy2], $
            title = cbar_title[j], $
            range = [ data_range[0, j], data_range[1,j] ], $
            tickinterval = ( data_range[1,j] - data_range[0,j] ) / 20, $
            textpos = 1, orientation = 1, border = 1, $
            font_size = fontsize, font_style = "italic", $
            ticklen = 0.3, subticklen = 0.5 $
            )

        ;cbar.rgb_table=color_table.(j))  ;; Is this needed for plots? Or at all?

    endif


    ;; Labels for entire window
    x_title = text(0.5, 0.02, xlabel, $
        font_size=fontsize, font_name=fontname, alignment=0.5)
    y_title = text(0.02, 0.5, ylabel, $
        font_size=fontsize, font_name=fontname, alignment=0.5, orientation=90)


    ;; Save graphic, if option to do so is set.
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

image_window.Show
plot_window.Show

end
