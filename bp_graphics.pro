; Filename:         bp_graphics.pro
; Last modified:    09 April 2017
; Programmer:       Laurel Farris
; Description:      Set up all structures containing graphics properties
;                       according to type of data being imaged.
;                   Structures are returned to the main level, and can then
;                       be passed to actual graphing routine.


pro BP_GRAPHICS, A, blah

    create_common
    COMMON bp_block
    
    resolve_routine, "color_tables", /either
    resolve_routine, "graphic_configs", /either
    GRAPHIC_CONFIGS, cbar_props, props

    text_props = { color : "black" }


    case blah of

        ;;  Images
        "im" : begin
            data = (A.data[*,*,0,*])^0.5
            props.min_value = min(data)
            props.max_value = max(data)
            props.rgb_table = color_tables( "IM_COLORS" )

            cbar_props.range = [props.min_value, props.max_value]
            cbar_props.title = "intensity [counts, arbitrary]"
            make_cbar = 0
            text_props.color = "white"
            print, "returning images"
            end


        ;; Cross-correlation images
        "cc" : begin
            data = A.cc
            props.min_value = threshold
            props.max_value = max(data)
            props.rgb_table = color_tables( "CC_COLORS" )
            cbar_props.range = [props.min_value, props.max_value]
            cbar_props.title = "maximum cross-correlation"
            cbar_props.tickformat = '(F4.2)'
            make_cbar = 1
            print, "returning cc images"
            end


        ;; Timelag images
        "tt" : begin
            data = A.tt
            ;; Cut off timelag for cc values less than threshold
            data[ where( A.cc lt threshold ) ] = -10000.0
            props.rgb_table = color_tables( "TT_COLORS" )
            ;props.min_value = round( min(A.tt))
            props.min_value = -150
            props.max_value = 150
            cbar_props.range = [props.min_value, props.max_value]
            ;cbar_props.title = "timelag [cadence]"
            cbar_props.title = "timelag [minutes]"
            make_cbar = 1
            print, "returning tt images"
            end

    endcase


; Filename:         graphic_configs.pro
; Last modified:    Wed 10 Mar 2017
; Programmer:       Laurel Farris
; Description:      General configurations that apply to all graphics.
;                       Call once to define common block, then shouldn't have to call again.


pro GRAPHIC_CONFIGS, $
    cbar_props, image_props, plot_props

    fontsize = 10

    ;; Colorbar properties
    cbar_props = { $
        orientation : 1, $
        device      : 0, $
        position    : [0.0, 0.0, 0.0, 0.0], $
        font_size   : fontsize+1, $
        font_style  : "italic", $
        textpos     : 1, $
        border      : 1, $
        ticklen     : 0.3, $
        subticklen  : 0.5, $
        major       : 11, $
        minor       : 5, $
        range       : [0.0, 0.0], $
        tickformat  : "", $
        title       : "" $
        }

    ;; Properties for any graphic (images and plots)

    ;; Image properties
    image_props = { $
        current    : 1, $
        device     : 0, $
        title      : "", $
        xtitle     : "", $
        ytitle     : "", $
        rgb_table  : intarr(256,3), $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1, $
        min_value : 0.0, $
        max_value : 0.0 $
        }

    ;; Scatterplot properties
    plot_props = { $
        current    : 1, $
        device     : 0, $
        title      : "", $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1 $
        }

end





    ;; Window
    wx = 700
    wy = 640
    ;wy = wx * (11.0/8.5)
    w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

    ;; Images
    n = (size(data, /dimensions))[2]
    im = objarr(n)

    pos = []
    letter = ["(a)", "(b)", "(c)", "(d)"]
    for i=0, n-1 do begin
        ;props.title = "$\lambda$="+A[i].wavelength+" $\AA$; log(T)="+A[i].temperature+"K"
        im[i] = image( data[*,*,i], $
            layout = [2,2,i+1], $
            margin = [0.11,0.11,0.10,0.09], $
            image_dimensions = [48, 48], $
            _EXTRA = props )
        if i mod 2 eq 1 then begin
            im[i].ytitle = ""
            im[i].position = im[i].position - [0.08, 0, 0.08, 0]
        endif
        pos = [ [pos], [im[i].position] ] 
        text = TEXT( pos[0,i]+0.01, pos[3,i]-0.04, letter[i], _EXTRA=text_props)
    endfor

    im[2].xtitle = "x [arcsec]"
    im[3].xtitle = "x [arcsec]"
    im[0].ytitle = "y [arcsec]"
    im[2].ytitle = "y [arcsec]"


    pos1 = im[-1].position
    pos2 = im[1].position
    ;cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]
    cx1 = pos1[2] + 0.02
    cy1 = pos1[1]
    cx2 = cx1 + 0.03
    cy2 = pos2[3]
    cbar_props.position = [ cx1, cy1, cx2, cy2]
    ;; Colorbar
    if make_cbar then cbar = colorbar( _EXTRA = cbar_props )

STOP
END;;
