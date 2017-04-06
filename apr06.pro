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