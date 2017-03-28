; Filename:         save_graphic.pro
; Last modified:    14 March 2017
; Programmer:       Laurel Farris
; Description:      Save graphics to file


PRO save_graphic

    b = ''
    read, b, prompt="Save figure (y/n)? "
    if b eq "y" then begin
        fname = ''
        read, fname, prompt="Enter file name to save: "
        p.save, "Figures/" + fname, resolution=300
    endif

end
