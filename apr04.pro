; IDL Version 8.3 (linux x86_64 m64)
; Journal File for laurel07@solarstorm.nmsu.edu
; Working directory: /solarstorm/laurel07/bp_project/repository
; Date: Tue Apr  4 14:33:17 2017
 
steps = [1]
.com bp
; % Type of end does not match statement (ENDFOREACH expected).
; % Type of end does not match statement (END expected).
; % 2 Compilation error(s) in module $MAIN$.
.com bp
print , steps
;       1
.run bp
steps = [2]
.com bp
.run bp
; 2
help, A
help, A[4]
.com bp
.run bp
; 4
; % Illegal subscript range: A.
help, cc
retall
help, cc
.run bp
; 5
; % End of file encountered before end of program.
; % Attempt to call undefined procedure/function: 'BP_PREP_GRAPHICS'.
retall
.run bp
; 5
; % Syntax error.
; % Syntax error.
; % Return statement in procedures can't have values.
; % Attempt to call undefined procedure/function: 'GRAPHIC_CONFIGS'.
retall
.run bp
; 5
; % Syntax error.
; % Syntax error.
; % Attempt to call undefined procedure/function: 'GRAPHIC_CONFIGS'.
retall
.run bp
; 5
; % Syntax error.
; % Attempt to call undefined procedure/function: 'GRAPHIC_CONFIGS'.
retall
.run bp
; 5
.com bp
.run bp
; 5
; y
retall
.run bp
; 
; n
;Retall, and start over.
retall
help, ''
.run bp
; 5
; y
;returning images
help, data
im = image(data[*,*,0], layout=[1,1,1], margin=0 )
im = image(data[*,*,4], layout=[1,1,1], margin=0 )
im = image(data[*,*,3], layout=[1,1,1], margin=0 )
print, n
;           6
help, im
retall
.run bp
; 5
; y
; % Syntax error.
; % Syntax error.
; % Syntax error.
; % Syntax error.
; % Syntax error.
; % Syntax error.
; % Syntax error.
;returning images
retall
.run bp
; 5
; y
;returning images
help, data
print, props.min_value
;     -2.00000
print, props.max_value
;      1077.00
retall
retall
.run bp
; 5
; y
;returning images
retall
.run bp
; 5
; y
;returning images
retall
.run bp
; 6
; y
retall
.run bp
; 6
; y
;      1077.00     -2.00000
;      1077.00     -2.00000
;      1077.00     -2.00000
;      1077.00     -2.00000
;      1077.00     -2.00000
;      1077.00     -2.00000
im = image(data[*,*,4])
im = image(data[*,*,4], _extra=props)
print, props
;{       1       0  x [pixels] y [pixels]       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0       0       0       0       0       0       0       0       0
;       0       0       0       0
;       2       0    0.0300000       5       7       0    0.0300000       5       7       8
;     -2.00000      1077.00}
help, props
print, A[4].wavelength
;211
retall
help, data
retall
.run bp
; % Syntax error.
; % 1 Compilation error(s) in module $MAIN$.
.run bp
; 5
; y
;returning images
.run bp
; 6
; y
retall
.run bp
; 6
; y
.run bp
; % Syntax error.
; % Type of end does not match statement (END expected).
; % 2 Compilation error(s) in module $MAIN$.
; % Syntax error.
; % End of file encountered before end of program.
; % 2 Compilation error(s) in module $MAIN$.
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
help, cc
retall
.run bp
; % MAX: Struct expression not allowed in this context: DATA.
help, cc
retall
help, cc
.run bp
;returning cc images
; % Expression must be a structure in this context: A.
retall
.run bp
; 5
; y
; % BP_GRAPHICS: Incorrect number of arguments.
retall
.run bp
; 5
; y
; % Tag name OTHERDATA is undefined for structure <Anonymous>.
retall
.run bp
; 5
; y
; % MAX: Variable is undefined: DATA.
retall
.run bp
; 5
; 
;returning cc images
; % Case statement found no matches.
retall
.run bp
; 5
; q
;returning cc images
; % Case statement found no matches.
retall
.run bp
; 
; 
;returning cc images
; % Case statement found no matches.
test = [45:55:1]
print, test
;      45      46      47      48      49      50      51      52      53      54      55
test2 = [45:55:2]
print, test2
;      45      47      49      51      53      55
retall
help, A
delvar, step
print, step
; % PRINT: Variable is undefined: STEP.
print, step eq !NULL
;   1
print, step eq 0
; % Variable is undefined: STEP.
help, A
.reset_session
;Executing SSW IDL_STARTUP for: GEN
;Executing SSW IDL_STARTUP for: SXT
;Including Paths:
; -----------------------------------
;| $SSW/yohkoh/gen/galileo/idl/lmsal |
; -----------------------------------
;Executing SSW IDL_STARTUP for: MDI
;Executing SSW IDL_STARTUP for: EIT
;executing EIT IDL_STARTUP
;Executing SSW IDL_STARTUP for: CDS
;Executing SSW IDL_STARTUP for: LASCO
;Including Paths:
; -----------------------------------------------
;| $SSW/packages/nrl/idl/nrlgen/aia              |
;| $SSW/packages/nrl/idl/nrlgen/analysis         |
;| $SSW/packages/nrl/idl/nrlgen/dfanning         |
;| $SSW/packages/nrl/idl/nrlgen/display/diva     |
;| $SSW/packages/nrl/idl/nrlgen/display          |
;| $SSW/packages/nrl/idl/nrlgen/lascoeit         |
;| $SSW/packages/nrl/idl/nrlgen/time             |
;| $SSW/packages/nrl/idl/nrlgen/util/discri_pobj |
;| $SSW/packages/nrl/idl/nrlgen/util             |
;| $SSW/packages/nrl/idl/nrlgen/widgets          |
; -----------------------------------------------
;Executing SSW IDL_STARTUP for: TRACE
;Executing SSW IDL_STARTUP for: XRT
;Including Paths:
; ------------------------------
;| $SSW/hinode/gen/idl/pointing |
;| $SSW/trace/idl/egse          |
;| $SSW/trace/idl/info          |
;| $SSW/trace/idl/ops           |
;| $SSW/trace/idl/site          |
;| $SSW/trace/idl/util          |
;| $SSW/trace/idl/wwwidl        |
; ------------------------------
;Executing SSW IDL_STARTUP for: EIS
;Executing SSW IDL_STARTUP for: AIA
;Including Paths:
; ---------------------------------
;| $SSW/vobs/gen/idl               |
;| $SSW/vobs/ontology/idl/gen_temp |
;| $SSW/vobs/ontology/idl/jsoc     |
;| $SSW/vobs/ontology/idl          |
; ---------------------------------
;Including Paths:
; ----------------------------
;| $SSW/sdo/gen/idl/attitude  |
;| $SSW/sdo/gen/idl/utilities |
; ----------------------------
;Executing SSW IDL_STARTUP for: EVE
;Including Paths:
; ---------------------------------
;| $SSW/vobs/gen/idl               |
;| $SSW/vobs/ontology/idl/gen_temp |
;| $SSW/vobs/ontology/idl/jsoc     |
;| $SSW/vobs/ontology/idl          |
; ---------------------------------
;Including Paths:
; ----------------------------
;| $SSW/sdo/gen/idl/attitude  |
;| $SSW/sdo/gen/idl/utilities |
; ----------------------------
;Executing SSW IDL_STARTUP for: HMI
;Including Paths:
; ---------------------------------
;| $SSW/vobs/gen/idl               |
;| $SSW/vobs/ontology/idl/gen_temp |
;| $SSW/vobs/ontology/idl/jsoc     |
;| $SSW/vobs/ontology/idl          |
; ---------------------------------
;Including Paths:
; ----------------------------
;| $SSW/sdo/gen/idl/attitude  |
;| $SSW/sdo/gen/idl/utilities |
; ----------------------------
;Executing SSW IDL_STARTUP for: SITE
;Including Paths:
; ---------------------------------
;| $SSW/yohkoh/ucon/idl/acton      |
;| $SSW/yohkoh/ucon/idl/bentley    |
;| $SSW/yohkoh/ucon/idl/freeland   |
;| $SSW/yohkoh/ucon/idl/hudson     |
;| $SSW/yohkoh/ucon/idl/labonte    |
;| $SSW/yohkoh/ucon/idl/lemen      |
;| $SSW/yohkoh/ucon/idl/linford    |
;| $SSW/yohkoh/ucon/idl/mcallister |
;| $SSW/yohkoh/ucon/idl/sato       |
;| $SSW/yohkoh/ucon/idl/mctiernan  |
;| $SSW/yohkoh/ucon/idl/metcalf    |
;| $SSW/yohkoh/ucon/idl/morrison   |
;| $SSW/yohkoh/ucon/idl/sakao      |
;| $SSW/yohkoh/ucon/idl/schwartz   |
;| $SSW/yohkoh/ucon/idl/slater     |
;| $SSW/yohkoh/ucon/idl/wuelser    |
;| $SSW/yohkoh/ucon/idl/zarro      |
; ---------------------------------
;Including Paths:
; ----------------------------
;| $SSW/trace/ssw_contributed |
; ----------------------------
;Executing SSW IDL_STARTUP: (Personal)
;Executed idl_startup.pro
