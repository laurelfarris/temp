; Last modified:    Mon Mar 20 12:57:04 EDT 2017
; Programmer:       Laurel Farris
; Filename:         bp_select_waves.pro


pro SELECT_WAVES, indices, waves, temps

    all_waves = [ '94', '131', '171', '193', '211', '304', '335' ]
    temps = ['6.8', '5.6, 7.0', '5.8', '6.2, 7.3', '6.3', '4.7']
    waves = all_waves[indices]
    temps = temps[indices]

end
