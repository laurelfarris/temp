; Last modified:    24 April 2017
; Filename:         bp.pro
; Programmer:       Laurel Farris
; Description:      Main script to call subroutines


pro MAKE_COMMON_BLOCK

    common BP_BLOCK, path, waves, temps, x, y, z, bp, get_data
    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'];, '335']
    temps = ['6.8', '7.0', '5.8', '7.3', '6.3', '4.7', '6.4']

    ;; Size of desired cube (x and y in spatial #pixels, z = #images, or 'time')
    x = 100
    y = 100
    z = 1

    bp = 1
    get_data = 0
end

MAKE_COMMON_BLOCK

;; Create structures with useful header info and initialize tag for data.
resolve_routine, "bp_structures", /either
A = BP_STRUCTURES()


;; Calculate cross-correlations
resolve_routine, "bp_structures", /either
threshold = 0.5
BP_TIMELAG, A, threshold, x0=50, y0=50, s=0, algorithm=0, cc_cube, tt_cube

end
