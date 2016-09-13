:reverse
SETLOCAL
set "str=%~2"
set __result__=
set len=xx
call strlen len "%str%"
:__loop_reverse__
if "%len%" NEQ "0" (
	set /a len-=1
	set "__result__=%__result__%%str:~-1%"
	set "str=%str:~0,-1%"
	goto __loop_reverse__
)
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF