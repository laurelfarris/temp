; Filename:         bp_graphics.pro
; Last modified:    14 March 2017
; Programmer:       Laurel Farris
; Description:      Set up all structures containing graphics properties
;                       according to type of data being imaged.
;                   Structures are returned to the main level, and can then
;                       be passed to actual graphing routine.


pro BP_GRAPHICS, A, data, blah

    
    resolve_routine, "color_tables", /either
    resolve_routine, "graphic_configs", /either
    GRAPHIC_CONFIGS, cbar_props, props

    props.xtitle = "x [pixels]"
    props.ytitle = "y [pixels]"
    cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]

    threshold = 0.5

    case blah of


        ;;  Images
        "im" : begin
            data = (A.data[*,*,0,*])
            props.min_value = min(data)
            props.max_value = max(data)
            props.rgb_table = color_tables( "IM_COLORS" )

            cbar_props.range = [props.min_value, props.max_value]
            cbar_props.title = "intensity [counts, arbitrary]"
            print, "returning images"
            end


        ;; Cross-correlation images
        "cc" : begin
            props.min_value = threshold
            props.max_value = max(data)
            props.rgb_table = color_tables( "CC_COLORS" )

            cbar_props.range = [props.min_value, props.max_value]
            cbar_props.title = "maximum cross-correlation"
            cbar_props.tickformat = '(F4.2)'
            print, "returning cc images"
            end


        ;; Timelag images
        "tt" : begin
            ;; Cut off timelag for cc values less than threshold
            ;data[ where( A.cc[*,*,0,*] lt threshold ) ] = -10000.0
            props.rgb_table = color_tables( "TT_COLORS" )
            ;props.min_value = round( min(A.tt))
            props.min_value = -150
            props.max_value = 150
            cbar_props.range = [props.min_value, props.max_value]
            ;cbar_props.title = "timelag [cadence]"
            cbar_props.title = "timelag [minutes]"
            print, "returning tt images"
            end

    endcase

    

    ;; Window
    wy = 828
    wx = wy * (8.5/11.0)
    w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

    ;; Images
    n = (size(data, /dimensions))[2]
    im = objarr(n)

    for i = 0, n-1 do begin
        props.title = "$\lambda$="+A[i].wavelength+" $\AA$; log(T)="+A[i].temperature+"K"
        im[i] = image( data[*,*,i], $
            layout = [2,3,i+1], $
            margin = 0.1, $
            _EXTRA = props )
        if i mod 2 eq 1 then im[i].position = im[i].position - [0.08, 0, 0.08, 0]
    endfor

    ;; Colorbar
    cbar = colorbar( _EXTRA = cbar_props )



END;;
