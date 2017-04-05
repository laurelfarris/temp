; Filename:         graphic_configs.pro
; Last modified:    Wed 10 Mar 2017
; Programmer:       Laurel Farris
; Description:      General configurations that apply to all graphics.
;                       Call once to define common block, then shouldn't have to call again.


pro GRAPHIC_CONFIGS, $
    cbar_props, image_props, scatter_props

    fontsize = 7

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
    scatter_props = { $
        current    : 1, $
        device     : 0, $
        title      : "", $
        axis_style : 2, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1, $
        symbol : 'dot', $
        sym_filled : 1, $
        sym_size : 1.0 $
        }

end
