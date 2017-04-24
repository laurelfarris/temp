; Filename:
; Last modified:    23 April 2017
; Programmer:       Laurel Farris
; Description:      Modify graphic properties according to type of data being imaged.




;; cross-correlation

cc_props = graphic_configs(1)
cc_cbar_props = graphic_configs(0)
cc_props.rgb_table = color_tables( "CC_COLORS" )
cbar_props.tickformat = '(F4.2)'
cbar_props.title = "maximum cross-correlation"
cbar_props.range = [cc_props.min_value, cc_props.max_value]


;; timelag

tt_props = graphic_configs(1)
tt_cbar_props = graphic_configs(0)
tt_props.rgb_table = color_tables( "TT_COLORS" )
cbar_props.title = "timelag [minutes]"
cbar_props.range = [tt_props.min_value, tt_props.max_value]

;-------------------------------------------------------------------------------------------------

;; Image 193 at different thresholds
;restore, "bp1_" + A[3].wavelength + "_cc_center_9refs.sav" ;; cc, tt
;cc = cc[*,*,4]
;for threshold = 0.3, 0.9, 0.1 do begin
;    cc[ where( cc lt threshold )] = 0.0
;    cc_data = [ [[cc_data]], [[cc]] ]
;endfor



;; Image all wavelengths
cc_data = []
tt_data = []
n_pixels = []
for i = 0, n_elements(A)-1 do begin
    restore, "bp1_" + A[i].wavelength + "_cc_center_9refs_alg.sav" ;; cc, tt
    cc_avg = mean( cc, dimension=3 )
    cc_data = [ [[cc_data]], [[cc[*,*,4]]] ]
    cc_data = [ [[cc_data]], [[ cc_avg ]] ]
    tt_data = [ [[tt_data]], [[tt[*,*,4]]] ]
    
    n_pixels = [ n_pixels, n_elements(where( cc_avg ne 0.0 )) ]
endfor
resolve_routine, "plot_area", /either
plot_area, A, n_pixels

STOP

threshold = 0.5

cc_props.min_value = threshold
cc_props.max_value = max(cc_data)

;; Cut off timelag for cc values less than threshold
tt_data[ where( cc_data lt threshold ) ] = -10000.0

tt_props.min_value = -150
tt_props.max_value = 150


STOP


;; Call procedure to make images
resolve_routine, "my_image", /either
my_image, tt_data, props, cbar_props=cbar_props, rows=3, del=1


end
