

pro MY_WINDOW, wx, wy, del=del

    win = getwindows( )
    if keyword_set(del) then begin
        for i = 0, n_elements(win)-1 do $
            if ( win[i] ne !NULL ) then win[i].close
    endif

    w = window( dimensions=[wx, wy], location=[0,0], buffer=0 )

end
