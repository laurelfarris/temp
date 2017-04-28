; Last modified:    25 April 2017
; Filename:         read_my_fits.pro
; Programmer:       Laurel Farris
; Description:      Read/restore data and headers, and create array of structures,
;                       one for each bandpass, with coronal hole data (1000x1000)

; Note: Written to correct for shifts using header info,
;   since corrections were not made before aligning.
; Need to redo all data to correct from the beginning.

; Tested that xcen and ycen were the same for each image in a given wavelength by using
; IDL's ARRAY_EQUAL routine.

; get_data = 0 --> Restore data from .sav files
; get_data = 1 --> Read in data from fits files (takes a long time)


pro READ_MY_FITS, index, data, wave


    common BP_BLOCK

    resolve_routine, "get_bp", /either
    resolve_routine, "bp_align", /either

    ;; Read in header info
    fls = ( file_search( path + "*" + wave + "A*.fits" ) )[0:z-1]

    case get_data of

        0 : begin
            READ_SDO, fls[0:z-1], index, data, /nodata
            ;; Restore aligned data (1000x1000; variable name = cube)
            restore, path + "aligned_" + wave + ".sav"
            data = shift( cube, round(index[0].xcen), round(index[0].ycen), 0 )
            data = GET_BP( data )
            end

        1 : begin
            READ_SDO, fls[0:z-1], index, cube
            ;; Shift cube according to header information
            ;; Use array_equal to make sure shifts are the same for every image!!
            cube = shift( cube, round(index[0].xcen), round(index[0].ycen), 0 )
            cube = cube[ 0:1999, 2000:3999, * ]
            BP_ALIGN, cube
            save, cube, filename = path + "aligned_" + wave + ".sav"
            end

    endcase


end
