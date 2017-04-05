;; Plot lightcurves and correlation curves vs. timelag
;; This was to check for possible instrumentation errors. 
;; we were comparing lightcurves and correlation values between
;; a pixel at (1000,1000) and some random other pixels.

;Pixels to be plotted:
x0 = 1000 & y0 = 1000

x = []
y = []
lc = []
r = []

;Time ('cadence', for x-axis)
t = (size(cube))[3]
tau = indgen(t)-(t/2)

; Loop to get pixels
n = 0
for i = 990,1010 do begin
  for j = 990,1010 do begin
    if corrArray[i,j] gt 0.5 then begin
      x = [x,i]
      y = [y,j]
      lc = [[lc],[REFORM(cube[i,j,*])]]
      r = [r,max(lc)-min(lc)]
      timelag, cube[x0,y0,*], cube[i,j,*], tau, maxcor,i,j 
      if n lt 10 then begin
        write_png, 'cc0' + strtrim(string(n),1) + '.png', tvrd(/true)
      endif else begin
        write_png, 'cc' + strtrim(string(n),2) + '.png', tvrd(/true)
      endelse
      n = n+1
    endif
  endfor
endfor

!P.MULTI=[0,1,1,0,0] ;(default)
window,0,xsize=850,ysize=250
background=255
color=0
charsize=1.25

; plot light curves
inc=max(r)
for i=0,n_elements(r)-1 do begin
  plot, tau, lc[*,i], xmargin=[10,3],ymargin=[4,2],$
    xstyle=1, xtitle='timelag    coords = ('+string(x[i])+ $
       ', ' + string(y[i])+')', $
    yrange=[min(lc),min(lc)+inc], ystyle=1, $
    ytitle='intensity',$
    color=color, background=background, charsize=charsize
  if i lt 10 then begin
      write_png, 'lc0' + strtrim(string(i),1) + '.png', tvrd(/true)
  endif else begin
      write_png, 'lc' + strtrim(string(i),2) + '.png', tvrd(/true)
  endelse
endfor

stop
;----------------------------------------------------------------;

x7 = 999 & y7 = 999
x1 = 999 & y1 = 1000
x2 = 999 & y2 = 1001
x3 = 1000 & y3 = 1001
x4 = 1001 & y4 = 1001
x5 = 1001 & y5 = 1000
x6 = 1001 & y6 = 999
x8 = 1000 & y8 = 999

; Create light curves for each pixel
lc0=REFORM(cube[x0,y0,*])
lc1=REFORM(cube[x1,y1,*])
lc2=REFORM(cube[x2,y2,*])
lc3=REFORM(cube[x3,y3,*])
lc4=REFORM(cube[x4,y4,*])

; Determine y-range for plots
r0 = max(lc0)-min(lc0)
r1 = max(lc1)-min(lc1)
r2 = max(lc2)-min(lc2)
r3 = max(lc3)-min(lc3)
r4 = max(lc4)-min(lc4)
inc=max([r0,r1,r2,r3,r4])

!P.MULTI=[0,1,1,0,0] ;(default)
window,0,xsize=850,ysize=250
background=255
color=0
charsize=1.25

plot, tau, lc0,xmargin=[10,3],ymargin=[4,2],$
      title='Central Pixel (1000,1000)' ,$
	  xstyle=1, xtitle='timelag',$
	  yrange=[min(lc0),min(lc0)+inc], ystyle=1, $
      ytitle='intensity',$
      background=background,color=color,charsize=charsize
	  write_png, 'lc0.png', tvrd(/true)
plot, tau, lc1,$ 
      title='Pixel at (991,992), cc=0.630071, tau=5', $
      xstyle=1,xtitle='timelag',$
	  yrange=[min(lc1),min(lc1)+inc], ystyle=1, $
      ytitle='intensity',$
      background=background,color=color,charsize=charsize 
	  write_png, 'lc1.png', tvrd(/true)
plot, tau, lc2, $
      title='Pixel at (989,977), cc=0.636164, tau=15', $
      xstyle=1,xtitle='timelag',$
	  yrange=[min(lc2),min(lc2)+inc], ystyle=1, $
      ytitle='intensity',$
      background=background,color=color,charsize=charsize 
	  write_png, 'lc2.png', tvrd(/true)
plot, tau, lc3, $
      title='Pixel at (964,972), cc=0.634095, tau=8', $
      xstyle=1,xtitle='timelag',$
	  yrange=[min(lc3),min(lc3)+inc], ystyle=1, $
      ytitle='intensity',$
      background=background,color=color,charsize=charsize 
	  write_png, 'lc3.png', tvrd(/true)
plot, tau, lc4, $
      title='Pixel at (1044,1041), cc=0.634338, tau=5', $
      xstyle=1,xtitle='timelag',$
	  yrange=[min(lc4),min(lc4)+inc], ystyle=1, $
      ytitle='intensity',$
      background=background,color=color,charsize=charsize 
	  write_png, 'lc4.png', tvrd(/true)

;; Plot correlation as a function of timelag

t = (size(cube))[3]
tau = indgen(t)-(t/2)

window,0,xsize=850,ysize=250
timelag, cube[x0,y0,*], cube[x0,y0,*], tau, maxcor 
	  write_png, 'cc0.png', tvrd(/true)
timelag, cube[x0,y0,*], cube[x1,y1,*], tau, maxcor 
	  write_png, 'cc1.png', tvrd(/true)
timelag, cube[x0,y0,*], cube[x2,y2,*], tau, maxcor 
	  write_png, 'cc2.png', tvrd(/true)
timelag, cube[x0,y0,*], cube[x3,y3,*], tau, maxcor 
	  write_png, 'cc3.png', tvrd(/true)
timelag, cube[x0,y0,*], cube[x4,y4,*], tau, maxcor 
	  write_png, 'cc4.png', tvrd(/true)

END

