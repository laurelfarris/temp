; IDL Version 8.3 (linux x86_64 m64)
; Journal File for laurel07@solarstorm.nmsu.edu
; Working directory: /solarstorm/laurel07/bp_project/repository
; Date: Thu Apr  6 08:49:18 2017
 
ls
; % Attempt to call undefined procedure/function: 'LS'.
A = indgen(10,10)
loc = where( A eq A[5,5] )
print, loc
;          55
ind = array_indices( A, loc )
print, ind
;           5           5
ind = array_indices( A, loc-1 )
print, ind
;           4           5
ind = array_indices( A, loc-2 )
print, ind
;           3           5
steps =[1,2]
.run bp
; % Common block BP_BLOCK must contain variables.
; % Attempt to call undefined procedure/function: 'BP_TIMELAG'.
retall
.run bp
; % Attempt to extend common block: TIMELAG_BLOCK
; % 2 Compilation error(s) in module CREATE_COMMON.
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
.run bp
; % Common block BP_BLOCK must contain variables.
; % Attempt to call undefined procedure/function: 'BP_GRAPHICS'.
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
.com bp
steps = [1]
.run bp
steps = [2,5]
.run bp
; % MAKE_ARRAY: Variable is undefined: Z.
retall
print, steps
;       2       5
.run bp
; % Attempt to call undefined procedure/function: 'CREATE_COMMON_VARS'.
retall
steps = [5]
.run bp
; % Variable is undefined: BLAH.
retall
.run bp
; % Expression must be a structure in this context: A.
help, A
retall
help, A
step = 2
.run bp
help, A
retall
help, A
.run bp
; % Variable is undefined: STEP.
step = 2
.run bp
help, A
step = 5
.run bp
;returning images
.run bp
; % Variable is undefined: STEP.
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
828*8.5/11.0
;       639.81818
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
.run bp
; % Variable is undefined: STEP.
step = 5
.run bp
;returning images
; % Program caused arithmetic error: Floating illegal operand
arr = indgen(10)
print, arr[4:]
; % Syntax error.
print, arr[4:*]
;       4       5       6       7       8       9
.com bp_timelag
help, A
.com bp
step = 4
.run bp
n_elements(A[2:*])
;           4
help, A[2].data
print, num_refs
; % PRINT: Variable is undefined: NUM_REFS.
.run bp
; % Variable is undefined: STEP.
step = 4
.run bp
print, num_refs
;           9
print, x0
;      41
print, y0
;      41
print, refs
;      40      40
;      39      40
;      41      40
;      40      39
;      40      41
;      39      39
;      41      39
;      39      41
;      41      41
print, algorithm
;       1
help, cube
help, cc
im = image(cc)
retall
step = 4
.run bp
;171
print, n_elements(A)
;           4
print, A[3].wavelength
;304
print, A[0].wavelength
;171
retall
step = 4
.run bp
.step
.step
.step
.step
.step
.step
;171
.step
.step
.step
.step
.step
.step
.step
retall
.run bp
.c
;171
retall
.run bp
help, cc
im = image( cc[*,*,0], layout=[1,1,1], margin=0 )
.c
retall
step = 6
.run bp
;returning cc images
retall
.run bp
; % Syntax error.
; % Syntax error.
; % Type of end does not match statement (END expected).
; % Variable is undefined: STEP.
retall
.run bp
; % Syntax error.
; % Type of end does not match statement (END expected).
; % Variable is undefined: STEP.
.run bp
; % Variable is undefined: STEP.
step=6
.run bp
; % Tag name CC is undefined for structure <Anonymous>.
delvar, A
step = 1
.run bp
; % You compiled a main program while inside a procedure.  Returning.
; % Tag name CC is undefined for structure <Anonymous>.
step = 1
.run bp
; % You compiled a main program while inside a procedure.  Returning.
; % Case statement found no matches.
retall
step = 1
.run bp
step - 2
; % Variable is undefined: STEP.
step =2
.run bp
.run bp
; 1
; % Case statement found no matches.
.run bp
; 
; % Case statement found no matches.
retall
.run bp
; % READ: Expression must be named variable in this context: <INT      (       0)>.
.run bp
; 1
.run bp
; 2
.run bp
; 3
;alignment routine goes here
.run bp
; 
; % Case statement found no matches.
print, A[2].cc[40,40]
;  1.77362e-41
.run bp
; 4
print, A[2].cc[40,40]
;  1.77362e-41
.run bp
; 4
; % Illegal subscript range: A.
.run bp
; % You compiled a main program while inside a procedure.  Returning.
; 4
;     0.735690
print, A[2].cc[40,40]
;  1.77362e-41
retall
.run bp
; 4
; % Type of end does not match statement (ENDFOREACH expected).
; % Keyword RANGE not allowed in call to: BP_TIMELAG
.run bp
; 4
;  1.77362e-41  1.77362e-41     0.735690  1.77362e-41  1.77362e-41  1.77362e-41
.run bp
; 4
;     0.735690
retall
help, A
print, A[3].cc[40,40]
;  1.77362e-41
print, A[2].cc[40,40]
;     0.735690
retall
.run bp
; 4
.run bp
; 5
; % Keyword parameters not allowed in call.
retall
.run bp
; 5
;returning cc images
.run bp
; 5
;returning cc images
.run bp
;