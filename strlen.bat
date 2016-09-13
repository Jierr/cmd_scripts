:strlen
SETLOCAL 
set /a __result__=0
set "str=%~2"
:__loop_strlen__
if "%str%" NEQ "" (
	set /a __result__+=1
	set "str=%str:~1%"
	goto __loop_strlen__
)
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF