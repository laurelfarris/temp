; Filename:         graphic_configs.pro
; Last modified:    Sun 16 Apr 2017
; Programmer:       Laurel Farris
; Description:      Make lightcurves and cc plots for example to explain cc concept.

; Add vertical lines where highest cc is. Delta tau, of sorts.

pro extra_axis, target

    ;; Extra axis to show time, as well as timelag.
    xaxis = axis( $
        'x', $
        location='top', $
        title="time [minutes]", $
        coord_transform=[0, 0.2], $
        tickfont_size=10, $
        target=target, $
        tickdir=1 )
end

plot_props = graphic_configs(2)

;; Lightcurves from center, close to center, and far away.

d1 = reform(a[3].data[50,50,*])
d2 = reform(a[3].data[50,53,*])
d3 = reform(a[3].data[5,5,*])

;; Run timelag between d1/d2, then d1/d3
t = indgen(300)
tau = t-150
timelag, d1, d2, tau, maxcor2, c2
timelag, d1, d3, tau, maxcor3, c3

;; Normalize (maybe not necessary?)
d1 = d1/max(d1)
d2 = d2/max(d2) + 0.75
d3 = d3/max(d3) + 1.50

my_window, 600, 600

;; Frame 1 - Lightcurves
p1 = plot( t, d1, $
    layout = [1,2,1], $
    margin = 0.15, $
    yrange = [0,3], $
    xtitle = "image number (12-second cadence)", $
    ytitle = "intensity (normalized)", $
    color = "red", $
    _EXTRA = plot_props $
    )
p2 = plot( t, d2, /overplot, $
    color = "blue" $
    )
p3 = plot( t, d3, /overplot, $
    color = "green" $
    )

;; Extra axis to show time, as well as timelag.
extra_axis, p1

;; Frame 2 - Cross correlation
p4 = plot( tau, c2, $
    layout = [1,2,2], $
    margin = 0.15, $
    xrange = [min(tau), max(tau)], $
    yrange = [-1.0, 1.0], $
    xtitle = "timelag", $
    ytitle = "cross-correlation", $
    _EXTRA = plot_props )
p5 = plot( tau, c3, /overplot )
extra_axis, p4

;; Add lettering to each plot
letters = [ "(a)", "(b)", "(c)" ]
text_y = [ 0.6, 1.2, 2.0 ]
for i = 0, 2 do begin
    text = text( 25, text_y[i], letters[i], font_size=10, data=1 )
endfor

end
