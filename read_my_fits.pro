; Last modified:    Sat Mar 18 13:02:14 EDT 2017
; Description:      Read headers and data from fits files. Save data if desired.

pro read_my_fits, sav=sav

    path = "/solarstorm/laurel07/Data/aia/"
    fls = file_search( path + "*.fits" )
    read_sdo, fls, index, data

    if keyword_set(sav) then $
        save, cube, path + "coronal_hole_" + wave + ".sav"


end
