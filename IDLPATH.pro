pathsep = PATH_SEP(/SEARCH_PATH)
;!PATH = '/solarstorm/laurel07/idl_codes/Modules' + pathsep + !PATH
!PATH = '' + pathsep + !PATH





; Read in data from file and pass to fourier2.pro, which returns power spectrum.
; 08 May 2016

function readfiles
    file = 'bp1_lc_size.dat'
    openr, mylun, file, /get_lun
    array = ''
    line = ''
    while not eof(mylun) do begin
        readf, mylun, line
        array = [array,line]
    endwhile
    free_lun, mylun

    end

function change_path
    pathsep = PATH_SEP(/SEARCH_PATH)
    !PATH = '/solarstorm/laurel07/idl_codes/modules' + pathsep + !PATH
    end

end
