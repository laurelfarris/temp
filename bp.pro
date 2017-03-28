; Last modified:    Mon Mar 20 12:57:04 EDT 2017
; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:
; Description:      Main program to run bp procedures.


PRO create_common_vars
    COMMON bp_block, path, waves, temps, x_center, y_center, x, y, z

    path = "/solarstorm/laurel07/Data/aia/"
    waves = [ '94', '131', '171', '193', '211', '304'] ;, '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    x_ref = 339 ;1300
    y_ref = 834 ;2300
    x = 100 ;1000
    y = 100 ;1000
    z = 300
END

; Create array of structures, one for each wavelength in 'waves'
create_common_vars
resolve_routine, "bp_structures", /either
A = BP_STRUCTURES()

end
