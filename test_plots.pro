



tau = indgen(300)-150
d1 = A[3].data[40,40,*]
d2 = A[3].data[30,40,*]
timelag, d1, d2, tau, maxcor, c
STOP

area = []
wavel = []
for i = 2, 5 do begin
    area = [area, n_elements( where( A[i].cc ne 0.0 ) )]
    wavel = [wavel, A[i].wavelength]
endfor


plot, wavel, area, background=254, color=0, ytitle="effective area [arcsec$^{2}$]", $
    xtitle="bandpass [$\AA{}$]"


END
