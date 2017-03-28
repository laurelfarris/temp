; Filename:         bp_graphics.pro
; Last modified:    14 March 2017
; Programmer:       Laurel Farris
; Description:      Set up all structures containing graphics properties
;                       according to type of data being imaged.
;                   Structures are returned to the main level, and can then
;                       be passed to actual graphing routine.


pro make_bp_images, cbar_props, props, data

    ;common GRAPHIC_BLOCK

    ;data = A.data[*,*,0,*]
    data = (A.data[30:89,30:89,0,*])^0.5
    ;data = (A.data[*,*,150,*])/max(A.data[*,*,150,*])
    props.min_value = min(data)
    props.max_value = max(data)
    props.title = ""
        A[i].title = wave_str + ", " + temp_str
        A[i].title2 = wave_str + ", t=" + time_str + " seconds"
        time = strmid(index.date_obs, 17, 5) + 60.*strmid(index.date_obs, 14, 2)
        im_str = strtrim( indgen(z)+1, 1 )
        time_str = strtrim( round(time), 1 )
        wave_str = "$\lambda$=" + strtrim( string(index[0].wavelnth), 1 ) + " $\AA$"
        temp_str = "log(T)=" + temps[i] + " K"

    props.rgb_table = [0] ;; CHECK ON THIS!
    cbar_props.range = [image_props.min_value, image_props.max_value]
    cbar_props.title = "intensity [counts, arbitrary]"

end

pro make_cc_images, cbar_props, props, data

    ;common GRAPHIC_BLOCK

    threshold = 0.5
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

end


pro make_tt_images, cbar_props, props, data

    ;common GRAPHIC_BLOCK

    threshold = 0.5
    data = A.tt[*,*,0,*]
    ;; Array of possible timelags using the observation time from fits header and
    ;; back timelags up halfway (standard procedure for cross-correlations)
    ;t = ( ( struc.time ) / 60.)
    ;t = ( ( A[i].time ) / 60.)
    ;tau = t - (max(t)/2.)
    ;; Cut off timelag for cc values less than threshold
    data[ where( A.cc[*,*,0,*] lt threshold ) ] = -10000.0
    props.rgb_table = colortable( [[wh],[rd],[ye],[bl],[wh]], $
            indices=[0,1,128,254,255], stretch=[0,10,-10,0] )
    ;image_props.min_value = round( min(A.tt))
    props.min_value = -150
    props.max_value = 150
    cbar_props.range = [image_props.min_value, image_props.max_value]
    cbar_props.title = "timelag [minutes]"
    ;cbar_props.title = "timelag [cadence]"

end


;common GRAPHIC_BLOCK, cbar_props, props, data

;; Get structures with properties to be applied during creation of graphics.
;; Currently returns all available structures... potential memory issue.
resolve_routine, "graphic_configs", /either
GRAPHIC_CONFIGS, cbar_props, props  ;, scatterplot_props

;; Call (ML) routine for type of data to show in figure
resolve_routine, "color_tables", /either
MAKE_BP_IMAGES, cbar_props, props, data
;MAKE_CC_IMAGES
;MAKE_TT_IMAGES


end
