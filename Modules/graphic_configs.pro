; Filename:         graphic_configs.pro
; Last modified:    Sat 09 Apr 2017
; Programmer:       Laurel Farris
; Description:      General configurations that apply to all graphics.
;                       Call once to define common block, then shouldn't have to call again.


function GRAPHIC_CONFIGS, blah

    fontsize = 10

    ;; Colorbar properties
    cbar_props = { $
        name        : "Color Bar", $
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


    ;; Image properties
    image_props = { $
        name       : "Image", $
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


    ;; 2.  Plot properties
    plot_props = { $
        name       : "Plot", $
        current    : 1, $
        device     : 0, $
        title      : "", $
        axis_style : 1, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        font_size  : fontsize+1 $
        }

    ;; Scatterplot properties
    scatterplot_props = { $
        name       : "ScatterPlot", $
        current    : 1, $
        device     : 0, $
        title      : "", $
        axis_style : 1, $
        xtickdir   : 0, xticklen : 0.03, xminor : 5, xtickfont_size : fontsize, $
        ytickdir   : 0, yticklen : 0.03, yminor : 5, ytickfont_size : fontsize, $
        symbol     : "*", $
        sym_size   : 2.0, $
        sym_thick  : 2.0, $
        sym_filled : 1, $
        font_size  : fontsize+1 $
        }


    case blah of
        0 : return, cbar_props
        1 : return, image_props
        2 : return, plot_props
        3 : return, scatterplot_props
    endcase

end
