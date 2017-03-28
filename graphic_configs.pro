; Filename:         graphic_configs.pro
; Last modified:    Wed 10 Mar 2017
; Programmer:       Laurel Farris
; Description:      General configurations that apply to all graphics
;                   Need to intialize more properties to defaults so they
;                       can be changed easily!


pro graphic_configs, $
    cbar_properties, image_properties, scatterplot_properties


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
        title       : "" $
        }

    ;; Properties for any graphic (images and plots)

    ;; Image properties
    image_properties = { $
        current    : 1, $
        device     : 0, $
        title      : "", $
        rgb_table  : 0, $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1 $
        min_value : 0.0, $
        max_value : 0.0, $
        xtitle : 'x [pixels]', $
        ytitle : 'y [pixels]' $
        }

    ;; Plot properties
    scatterplot_properties = { $
        current    : 1, $
        device     : 0, $
        title      : "", $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1 $
        symbol : 'dot', $
        sym_filled : 1, $
        sym_size : 1.0 $
        }



end
