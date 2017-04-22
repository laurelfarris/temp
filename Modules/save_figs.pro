

PRO save_figs, filename

    fig_path = "/home/users/laurel07/Dropbox/Figures/"
    result = getwindows( /current )
    result.save, fig_path + filename + ".png"
    END
