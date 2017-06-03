:int_to_hex
setlocal enabledelayedexpansion

set int=%~2
set hex=
set tmp=
set __result__= 

:mod
	set /a "tmp=%int%%%16"
	if %tmp% GEQ 0 if %tmp% LEQ 9 set "hex=%tmp%%hex%"
	if %tmp% EQU 10 set "hex=A%hex%"
	if %tmp% EQU 11 set "hex=B%hex%"
	if %tmp% EQU 12 set "hex=C%hex%"
	if %tmp% EQU 13 set "hex=D%hex%"
	if %tmp% EQU 14 set "hex=E%hex%"
	if %tmp% EQU 15 set "hex=F%hex%"
:div
	set /a int=%int%/16
	if %int% NEQ 0 goto mod
	set __result__=%hex%

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF