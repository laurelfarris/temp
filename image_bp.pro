; Filename:         bp_graphics.pro
; Last modified:    20 April 2017
; Programmer:       Laurel Farris
; Description:      Modify graphic properties according to type of data being imaged.


pro image_full, data

    MY_WINDOW, 800, 800
    im = image( data, /current, layout=[1,1,1], margin=0.0 )
    ;box = symbol( 339+800, 834+1800, 'square', /data, $
    ;    sym_filled=0, sym_color='red', sym_size=5 )
end



pro image_bp, data


    props = graphic_configs(1)
    props.min_value = min(data)
    props.max_value = max(data)
    props.rgb_table = color_tables( "IM_COLORS" )

    pos = []
    letter = ["(a)", "(b)", "(c)", "(d)", "(e)", "(f)"]

    n = n_elements(data[0,0,*]) ;; alternative to size, which gives error for 2D data
    im = objarr(n)
    rows = ((n-1)/2) + 1
    cols = n/rows

    MY_WINDOW, 800, 800

    for i=0, n-1 do begin

        ;; Temporary... plots publications never have titles.
        ;props.title = "$\lambda$="+A[i].wavelength+" $\AA$; log(T)="+A[i].temperature+"K"

        im[i] = image( data[*,*,i], $
            layout = [cols, rows,i+1], $
            margin = 0.1, $
            _EXTRA = props )
        pos = [ [pos], [im[i].position] ] 
        text = TEXT( pos[0,i]+0.01, pos[3,i]-0.04, letter[i], color='white' ) 
    endfor


end

cc_cube_avg = mean( cc_cube, dimension=3 )
image_bp, A.data[*,*,0,*]

;data = (A[3].full)^0.5
;image_full, data


end
