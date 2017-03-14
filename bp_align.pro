; Programmer:       Laurel Farris
; Filename:         bp_align.pro
; Last modified:    13 December 2016
; Function(s):      align_cube3.pro, alignoffset.pro, align_shift_sub.pro
; Description:      Align images


pro bp_align, data_in, path=path, sav=sav


    resolve_routine, "align_cube3", /either
    for i = 0, n_elements(data_in) do begin

        print, '--------------------------------------------'
        print, "Beginning alignment for wavelength ", data_in[i].wavelength

        ;; Set up filename to save to, and pull data cube from structure
        cube = data_in[i].data

        ;; Start alignment. Note this may take a while, depending on size of cube;
        ;;      1000 x 1000 x 300 x 6 took ~4 hours.
        my_average = []
        repeat begin
            ALIGN_CUBE3, cube, avg 
            my_average = [my_average, avg]
            k = n_elements(my_average)
        endrep until (k ge 2 && my_average[k-1] gt my_average[k-2])
        

        ;; Save aligned cube.
        if keyword_set(sav) then begin
            save, cube, filename = path + "aligned_" + wave + ".sav"
        endif

        data_in[i].data = cube

    endfor

end


path = "/solarstorm/laurel07/data/aia/"
bp_align, A, path=path, sav=1

end
