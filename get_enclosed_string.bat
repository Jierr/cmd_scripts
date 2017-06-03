:get_enclosed_string
setlocal enabledelayedexpansion

set __result__=
set "string=%~2"
set "start=%~3"
set "end=%~4"

set spos=spos
set epos=epos

call find_substring %spos% "%string%" "%start%"
call find_substring %epos% "!string:~%spos%!" "%end%"

if %spos% LSS 0 goto end_get_enclosed_string
set sub=0
:startsub
if "!start:~%sub%!" NEQ "" (
	set /a sub+=1
	goto startsub
)

set /a spos+=sub
set /a len=%epos%-%spos%
if %epos% LSS 0 goto end_get_enclosed_string

rem echo Postition of "%start%" is %spos%
rem echo Position of "%end%" is %epos%

call set "__result__=%%string:~%spos%,%len%%%"

:end_get_enclosed_string
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF