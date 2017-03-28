; Last modified:    Mon Mar 20 14:26:43 EDT 2017
; Filename:         read_my_fits.pro
; Programmer:       Laurel Farris
; Description:      Read header info from fits files and restore data from .sav files
;                   Returns array of structures, one for each wavelength.
;                   Takes a minute or two to run...


function READ_DATA, wave, $
    x_center = x_center, $
    y_center = y_center, $
    x = x, $
    y = y, $
    z = z, $
    res=res, $
     _EXTRA=e

    ;; Note: Written to correct for shifts using header info,
    ;;   since corrections were not made before aligning.
    ;; Need to redo all data to correct from the beginning.

    ;; Read in header info to get x and y shifts (faster if read in x/ycen only?)
    path = "/solarstorm/laurel07/Data/aia/"
    fls = ( file_search( path + "*" + wave + "A*.fits" ) )[0:z-1]

    ;; Restore aligned data (1000x1000 cube)
    if keyword_set(nodata) then $
        restore, path + "aligned_" + wave + ".sav"

    ;; Read headers and data (if nodata = 0) from fits files.
    READ_SDO, fls, index, cube, nodata=nodata

    ;; shift in x and y based on header (index.xcen, index.ycen).
    x_center = x_center - round(index[0].xcen)
    y_center = y_center - round(index[0].ycen)

    ;; Trim cube to desired range.
    return, cube[ $
        x_center - (x/2)  :  x_center + (x/2)-1, $
        y_center - (y/2)  :  y_center + (y/2)-1, $
        * ]

    ;; Correct shift in each bandpass using header values
    ;;  (check to see if these change from one image to the next for a given wave
    ;;  and/or if arrays can be used to shift like this.
    ;; Shifting data itself instead of moving location of reference pixel...
    ;data = shift( temporary(data), index[0].xcen, index[0].ycen )

end


;; Wrappers used to set default values and to call functions to read/restore data.
;;   Get error if kw in e is not accepted by READ_DATA.

function READ_WRAPPER, wave, _EXTRA=e
    return, READ_DATA( wave, $
        x_center=1300, $
        y_center=2300, $
        x=1000, $
        y=1000, $
        z=300, $
        nodata=0, $
        _STRICT_EXTRA = e )
end
function RESTORE_WRAPPER, wave, _EXTRA=e
    return, READ_DATA( wave, $
        x_center=339, $
        y_center=834, $
        x=100, $
        y=100, $
        z=300, $
        nodata=1, $
        _STRICT_EXTRA = e ) ; get error if kw in e is not accepted by READ_DATA
end
