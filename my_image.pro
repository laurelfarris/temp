
pro quick_graphics, data

    my_im = avg_cc > 0.5
    im = image( my_im, _EXTRA = props )
    im2 = image( A[3].data[*,*,0]^0.5, _EXTRA = props )


    for i = 0, 5 do begin
        im = image( (A[i].data[*,*,0])^0.5, /current, layout=[2,3,i+1] ); , margin=0.5 );, dimensions=[700,700] )
    endfor

end
