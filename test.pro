
for i = 0, 5 do begin
   d = A[i].data[*,*,0]
   loc = where( d eq max(d) )
   ind = array_indices( d, loc )
   print, ind
endfor

end
