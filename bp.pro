; Last modified:    Wed Apr 05
; Programmer:       Laurel Farris
; Filename:         bp.pro
; Subroutines:
; Description:      Main program to run bp procedures.


x_ref = 339
y_ref = 834
STOP

resolve_routine, "bp_structures", /either
A = bp_structures()

resolve_routine, "bp_timelag", /either
BP_TIMELAG, A, range=[2:5], algorithm=0
BP_TIMELAG, A, range=[2:5], algorithm=1

resolve_routine, "bp_graphics", /either
BP_GRAPHICS, A[3], "im";, blah="cc", blah="tt"


end
