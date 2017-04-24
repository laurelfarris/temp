; Filename:         graphic_configs.pro
; Last modified:    Sun 16 Apr 2017
; Programmer:       Laurel Farris
; Description:      Make lightcurves and cc plots for example to explain cc concept.

; Add vertical lines where highest cc is. Delta tau, of sorts.

pro extra_xaxis, target

    ;; Extra axis to show time, as well as timelag.
    xaxis = axis( $
        'x', $
        location='top', $
        title="time [minutes]", $
        xrange=[-30, 30], $
        coord_transform=[0, 0.2], $
        tickfont_size=10, $
        target=target, $
        tickdir=1 )
end


resolve_routine, "graphic_configs", /either
plot_props = graphic_configs(2)

;; Lightcurves from center, close to center, and far away.
d1 = reform(A[3].data[50,50,*])
d2 = reform(A[3].data[52,50,*])
d3 = reform(A[3].data[5,5,*])

;; Run timelag between d1/d2, then d1/d3
t = indgen(300)
tau = t-150
timelag, d1, d2, tau, maxcor2, c2
timelag, d1, d3, tau, maxcor3, c3

my_window, 600, 600, /del

;; Frame 1 - Lightcurves
p1 = plot( t, d1, $
    layout = [1,2,1], $
    margin = 0.15, $
;    yrange = [0,3], $
    xtitle = "image number (12-second cadence)", $
    ytitle = "intensity (normalized)", $
    color = "black", $
    _EXTRA = plot_props $
    )
p2 = plot( t, d2, /overplot, color = "red" )
p3 = plot( t, d3, /overplot, color = "blue" )


;; Extra axis to show time, as well as timelag.
extra_xaxis, p1




;; Frame 2 - Cross correlation
p4 = plot( tau, c2, $
    layout = [1,2,2], $
    margin = 0.15, $
    xrange = [-150, 150], $
    yrange = [-1.0, 1.0], $
    xtitle = "timelag", $
    ytitle = "cross-correlation", $
    color  = "red", $
    _EXTRA = plot_props )
p5 = plot( tau, c3, color="blue", /overplot )
extra_xaxis, p4

;; Add lettering to each plot
letters = string( bindgen(1,26) + (byte('a'))[0] )
text_y = [ 0.875, 0.80, 0.60 ]
colors = [ "black", "red", "blue" ]
for i = 0, 2 do $
    text = text( 0.2, text_y[i], "("+letters[i]+")", font_size=10, color=colors[i] )

text = text( 0.6, 0.16, "$\tau$="+strtrim(maxcor2[0],1), color="red", font_size=10 )
text = text( 0.6, 0.14, "$C_{max}$="+strtrim(maxcor2[1],1), color="red", font_size=10 )
text = text( 0.6, 0.12, "$\tau$="+strtrim(maxcor3[0],1), color="blue", font_size=10 )
text = text( 0.6, 0.10, "$C_{max}$="+strtrim(maxcor3[1],1), color="blue", font_size=10 )

end
