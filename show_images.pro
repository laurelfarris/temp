; Filename:         bp_graphics.pro
; Last modified:    23 April 2017
; Programmer:       Laurel Farris
; Description:      Input data and properties, adjust positions and show graphics


pro my_image, data, props, cbar_props=cbar_props, rows=rows, del=del

    pos = []
    letters = string( bindgen(1,26) + (byte('a'))[0] )
    n = n_elements(data[0,0,*]) ;; alternative to size, which gives error for 2D data
    im = objarr(n)
    cols = n/rows
    MY_WINDOW, 700, 810, del=del

    for i=0, n-1 do begin

        ;; Temporary... plots publications never have titles.
        ;props.title = "$\lambda$="+A[i].wavelength+" $\AA$; log(T)="+A[i].temperature+"K"

;        props.max_value = max(data[*,*,i])

        im[i] = image( data[*,*,i], $
            layout = [cols, rows,i+1], $
            margin = 0.08, $
            _EXTRA = props )

        if i mod 2 eq 1 then begin
            im[i].position = im[i].position + [-0.10, 0.02, -0.10, 0.02]
        endif else begin
            im[i].ytitle = "y [pixels] "
            im[i].position = im[i].position + [0, 0.02, 0, 0.02]
        endelse

        ;; Add text to each image
        pos = [ [pos], [im[i].position] ] 
        letter = "(" + letters[i] + ")"
        text = TEXT( pos[0,i]+0.01, pos[3,i]-0.03, letter, color='black' ) 
        
    endfor
    im[4].xtitle = "x [pixels]"
    im[5].xtitle = "x [pixels]"



    ;; Colorbar
    if keyword_set(cbar_props) then begin
        pos1 = im[-1].position
        pos2 = im[1].position
        cx1 = pos1[2] + 0.025
        cy1 = pos1[1]
        cx2 = cx1 + 0.035
        cy2 = pos2[3]
        cbar_props.position = [ cx1, cy1, cx2, cy2]

        cbar = colorbar( _EXTRA = cbar_props )
    endif

end
