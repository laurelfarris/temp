; Filename:
; Last modified:    23 April 2017
; Programmer:       Laurel Farris
; Description:      Image full disk, bps, etc.




props = graphic_configs(1)
props.rgb_table = color_tables( "IM_COLORS" )

data = A.data[*,*,0,*]

resolve_routine, "my_image", /either
my_image, data, props, rows=3, del=1


;my_window, 800, 600, /del
;im = image( (A[3].full)^0.5, layout=[1,1,1], margin=0.0, /current)
;box = symbol( 339+800, 834+1800, 'square', /data, sym_color='red', sym_size=5 )

;im = image( (A[3].data[*,*,0])^0.5, layout=[1,1,1], margin=0.0, /current )

;save_figs, "full_193_new"
;save_figs, "bp_193"
save_figs, "bp1_im_6"





end
