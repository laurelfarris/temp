; Filename:         bp_graphics.pro
; Last modified:    09 April 2017
; Programmer:       Laurel Farris
; Description:      Set up all structures containing graphics properties
;                       according to type of data being imaged.
;                   Structures are returned to the main level, and can then
;                       be passed to actual graphing routine.




blah = "im"
length = 100
x1 = x_ref - (length/2)
x2 = x_ref + (length/2)
y1 = y_ref - (length/2)
y2 = y_ref + (length/2)


case blah of

    ;;  Images
    "im" : begin
        data = (A.data[x1:x2, y1:y2, 0])^0.5
        props.min_value = min(data)
        props.max_value = max(data)
        props.rgb_table = color_tables( "IM_COLORS" )
        textcolor = "white"
        print, "returning images"
        end


    ;; Cross-correlation images
    "cc" : begin
        data = A.cc
        props.min_value = threshold
        props.max_value = max(data)
        props.rgb_table = color_tables( "CC_COLORS" )
        cbar_props.range = [props.min_value, props.max_value]
        cbar_props.title = "maximum cross-correlation"
        cbar_props.tickformat = '(F4.2)'
        make_cbar = 1
        print, "returning cc images"
        end


    ;; Timelag images
    "tt" : begin
        data = A.tt
        ;; Cut off timelag for cc values less than threshold
        data[ where( A.cc lt threshold ) ] = -10000.0
        props.rgb_table = color_tables( "TT_COLORS" )
        ;props.min_value = round( min(A.tt))
        props.min_value = -150
        props.max_value = 150
        cbar_props.range = [props.min_value, props.max_value]
        ;cbar_props.title = "timelag [cadence]"
        cbar_props.title = "timelag [minutes]"
        make_cbar = 1
        print, "returning tt images"
        end
endcase


n = n_elements(data[0,0,*])
rows = ((n-1)/2) + 1
cols = n/rows

MY_WINDOW, 700, 800
im = objarr(n)

;; Images
pos = []
letter = ["(a)", "(b)", "(c)", "(d)"]
for i=0, n-1 do begin
    props.title = "$\lambda$="+A[i].wavelength+" $\AA$; log(T)="+A[i].temperature+"K"
    im[i] = image( data[*,*,i], $
        layout = [cols, rows,i+1], $
        margin = 0.1, $
        _EXTRA = props )
    if i mod 2 eq 1 then begin
        im[i].ytitle = ""
        im[i].position = im[i].position - [0.08, 0, 0.08, 0]
    endif
    pos = [ [pos], [im[i].position] ] 
   ; text = TEXT( pos[0,i]+0.01, pos[3,i]-0.04, letter[i], color=textcolor ) 
endfor
im[0].xtitle = "x [pixels]"
im[0].ytitle = "y [pixels]"
STOP

im[2].xtitle = "x [arcsec]"
im[3].xtitle = "x [arcsec]"
im[0].ytitle = "y [arcsec]"
im[2].ytitle = "y [arcsec]"


pos1 = im[-1].position
pos2 = im[1].position
;cbar_props.position = [0.87, 0.03, 0.90, 0.97 ]
cx1 = pos1[2] + 0.02
cy1 = pos1[1]
cx2 = cx1 + 0.03
cy2 = pos2[3]
cbar_props.position = [ cx1, cy1, cx2, cy2]

;; Colorbar
if make_cbar then cbar = colorbar( _EXTRA = cbar_props )


END;;
