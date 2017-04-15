; Last modified:    Fri Apr 14 06:50:54 MDT 2017

; Consider putting plots and images in the same code.
; Makes more sense to read in all properties at once...
;  and can deal with same data set all at once.

; Does window size affect quality of image when read into a paper?
; Try default vs. layout=[1,1,1], etc. and read both into paper to compare.
; Same resolution? Same amount of white space around graphic?
; Either way, get rid of extra white space around graphics.

; Combine plot and image properties.

; Examine each bandpass individually, even for same bp.

; Run alignment again


;; Six bps in single bandpass
bps = [
    [415, 500], $
    [415, 500], $
    [415, 500], $
    [415, 500], $
    [415, 500], $
    [330, 300] $
    ]

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

n = n_elements(bps)
rows = n/2
cols = n/rows

r = 50
d = r * 2

my_window, wx, wy

for i = 0, 5 do begin

    x = bps[0,i]
    y = bps[1,i]
    data = reform( A[2].data[ x-r:x+r-1, y-r:y+r-1, 0], d, d )
    radius = my_radius(data)

    p = scatterplot( radius, data, $
        layout=[cols,rows,i+1], margin=0.1, $
        _EXTRA=scatterplot_props
    )
endfor

end
