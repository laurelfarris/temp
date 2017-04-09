
fontsize = 10
plot_props = { $
    current    : 1, $
    ;device     : 0, $
    ;xtickdir   : 0, ytickdir   : 0, $
    ;xticklen   : 0.03, $
    ;yticklen   : 0.02, $
    ;xmajor     : 6, $
    ;xminor     : 0, $
    ;ymajor     : 10, $
    ;yminor     : 5, $
    ;axis_style : 2, $
    ;xstyle     : 3, $
    ;ystyle     : 2, $
    ;xrange     : [0, 2.*!PI], $
    ;yrange     : [-1.1, 1.1], $
    ;xtickformat: '(I)', $
    ;ytickformat: '(F5.2)', $
    xtickname  : "", $
    ytickname  : "", $
    ;xshowtext  : 0, $
    ;yshowtext  : 0, $
    ;title      : "", $
    ;xtitle     : "x", $
    ;ytitle     : "f(x)", $
    font_size  : fontsize+1, xtickfont_size : fontsize, ytickfont_size : fontsize $
    }


n = 1000
y1 = interpolate(randomu(seed, 10), indgen(n)/n)
y2 = shift(y1, 10)

tau = indgen(n)
timelag, y1, y2, tau, maxcor, c

;; Window
if (getwindows('plot')) then w.close
wx = 700
wy = 300
w = window( dimensions=[wx, wy], location=[0, 0], buffer=0 )

p1 = plot( tau, y1, color="blue", layout=[1,2,1], $
    ;xrange=[0, 2.*!PI], $
    xtitle = "x", ytitle = "f(x)", $
    _EXTRA=plot_props )
p2 = plot( tau, y2, color="red", /overplot )

p3 = plot( tau, c, layout=[1,2,2], $
    xtitle = "lag", $
    ytitle = "cross-correlation", $
    _EXTRA=plot_props )
STOP


area = []
wavel = []
for i = 2, 5 do begin
    area = [area, n_elements( where( A[i].cc_alg ne 0.0 ) )]
    wavel = [wavel, fix(A[i].wavelength)]
endfor

area = area * 0.36

;; Plot
xtickname = [ "", A[2:*].wavelength, "" ]
p = scatterplot( indgen(4), area, symbol="*", xtickname=xtickname, $
    sym_size=2, $
    _EXTRA=plot_props )



STOP



d1 = reform(A[3].data[40,40,*])
d2 = reform(A[3].data[38,40,*])

d1 = d1/max(d1) + 1.0
d2 = d2/max(d2) + 2.0

tau = indgen(300)-150
timelag, d1, d2, tau, maxcor, c

p1 = plot( tau, c, _EXTRA=plot_props )
p2 = plot( tau, d1, overplot=1, _EXTRA=plot_props )
p3 = plot( tau, d2, overplot=1, _EXTRA=plot_props )

x = 0.15
text = TEXT( x,0.17, "(a)")
text = TEXT( x,0.59, "(b)")
text = TEXT( x,0.75, "(c)")


END
