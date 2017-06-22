:find_substring
setlocal enabledelayedexpansion
set "str=%~2"
set "sub=%~3"
set __result__=-1
set start=0
set pos=0
set curr_pos=0

set /a len=0

:setlen
if "!sub:~%len%!." NEQ "." (
	set /a "len=%len%+1"
	goto setlen
)
rem echo length of "%sub%" is %len%

:search
:sub
if "!str:~%pos%,1!" == "" goto done
if "%sub%"=="!str:~%pos%,%len%!" goto equal
:notequal
set /a pos+=1
goto search

:equal
set __result__=!pos!

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF