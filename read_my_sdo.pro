; Last modified:    15 April 2017
; Filename:         bp_structures.pro
; Programmer:       Laurel Farris
; Description:      Read/restore data and headers, and create array of structures,
;                       one for each bandpass, with coronal hole data (1000x1000)

; Note: Written to correct for shifts using header info,
;   since corrections were not made before aligning.
; Need to redo all data to correct from the beginning.


function GET_BP_CUBE, data, x=x, y=y, z=z, bp=bp

    bps = [ $
        [339, 834], $
        [215, 895], $
        [415, 665], $
        [460, 445], $
        [200, 495], $
        [340, 615] ]

    rad = x/2
    x1 = bps[0,bp] - rad
    x2 = bps[0,bp] + rad - 1
    y1 = bps[1,bp] - rad
    y2 = bps[1,bp] + rad - 1

    return, data[ x1:x2, y1:y2, 0:z-1 ]
end


function bp1_structures

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'];, '335']
    temps = ['6.8', '7.0', '5.8', '7.3', '6.3', '4.7', '6.4']

    ;; Size of desired cube (x and y in spatial #pixels, z = #images, or 'time')
    x = 100
    y = 100
    z = 300

    ;; Read data or restore .sav files
    get_data = 0
    bp = 0

    ;; Restore data and read headers
    foreach wave, waves, i do begin

        ;; Read in header info
        fls = ( file_search( path + "*" + wave + "A*.fits" ) )[0:z-1]
        READ_SDO, fls, index, cube, /nodata

        ;; Restore aligned data (1000x1000; variable name = cube)
        restore, path + "aligned_" + wave + ".sav"
        cube = shift( cube, round(index[0].xcen), round(index[0].ycen), 0 )

        A[i].data = GET_BP_CUBE( cube, x=x, y=y, z=z, bp=bp )

    endforeach

    return, A

end

A = bp1_structures()

end
