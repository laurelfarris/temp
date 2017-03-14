; Filename:         graphic_configs.pro
; Last modified:    Wed 10 Mar 2017
; Programmer:       Laurel Farris
; Description:      General configurations that apply to all graphics


pro graphic_configs, cbar_properties, graphic_properties, image_properties


    fontsize = 7

    ;; Colorbar properties
    cbar_properties = { $
        orientation : 1, $
        device      : 0, $
        position    : [0.0, 0.0, 0.0, 0.0], $
        font_size   : fontsize+1, $
        font_style  : "italic", $
        textpos     : 1, $
        border      : 1, $
        ticklen     : 0.3, $
        subticklen  : 0.5, $
        major       : 0, $
        minor       : 0, $
        range       : [0.0, 0.0], $
        tickformat  : "", $
        title       : "" }

    ;; Properties for any graphic (images and plots)
    graphic_properties = { $
        current    : 1, $
        device     : 0, $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1 }

    ;; Image properties
    image_properties = { $
        min_value : 0.0, $
        max_value : 0.0, $
        xtitle : 'x [pixels]', $
        ytitle : 'y [pixels]' }


end
