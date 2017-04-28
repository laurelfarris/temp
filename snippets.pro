;; Portions of codes that I didn't end up using, but may want to
;;   in the future...





    ;; Create error handler to close window if an error occurs
    catch, error_status
    if error_status ne 0 then begin
        w.close
        retall
    endif


; Reform data cubes
my_data = []
cc = []
tt = []
my_title = []
for i = 0, n_elements(A)-1 do begin
    my_title = [my_title, $
        "$\lambda$ = " + A[i].wavelength + " $\AA$, log(T) = " + A[i].temperature + " K"]
    n = sqrt(n_elements(A[i].cc_im))
    my_data = [ [[my_data]], [[A[i].bp_im[*,*,0]]] ]
    cc = [ [[cc]], [[reform(A[i].cc_im,n,n)]] ]
    tt = [ [[tt]], [[reform(A[i].tt_im,n,n)]] ]
endfor




;; Read in data from files created previously.
data_path = '/solarstorm/laurel07/Research_repo/new_python_codes/bp_size/'
file = data_path + waves[i] + '_bp_sizes.dat'
openr, mylun, file, /get_lun
array = fltarr(5, file_lines(file))
readf, mylun, array
x_coo = array[0, *] & y_coo = array[1, *]
r = reform(array[2, *]) & c = reform(array[3, *]) & t = reform(array[4, *])
free_lun, mylun
; Scale timelag by 1/3 ;; or use some array manipulation to sort, then cut
;r = r[where(abs(t) le 50)] ;c = c[where(abs(t) le 50)] ;t = t[where(abs(t) le 50)]

;intensity = transpose(d.(0)[1090:1190, 2580:2680,i])
;re_intensity = (reform( intensity, 10201 ))  ; /max(intensity)
;x_data = r
;y_data = re_intensity
x_data = t[where(c ge 0.5)]
y_data = c[where(c ge 0.5)]

x_r = max(x_data) - min(x_data)
y_r = max(y_data) - min(y_data)



    ;; Set size and location of graphics
    ;N = n_elements(A)
;    N = (size(data))[3]
;    cols = ( (N-1) mod 2) + 1
;    rows = N/cols
;    N = cols * rows
;    gap = 50.
;    side = (wy - (gap * (rows+1))) / rows
;    x = (indgen(N)  /  rows) * (side + gap) + gap
;    y = (indgen(N) mod rows) * (side + gap) + gap

    ;; Set size and location of colorbar
;    cx1 = x[-1] + side + 0.5*gap
;    cy1 = gap
;    cx2 = cx1 + 0.5*gap
;    cy2 = y[-1] + side

;    cbar.position = [cx1, cy1, cx2, cy2]
