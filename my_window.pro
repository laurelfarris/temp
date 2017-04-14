

pro MY_WINDOW, wx, wy

    win = getwindows( )
    for i = 0, n_elements(win)-1 do begin
        if ( win[i] ne !NULL ) then win[i].close
        endfor

    w = window( dimensions=[wx, wy], location=[0,0], buffer=0 )

end
