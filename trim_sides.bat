SETLOCAL ENABLEDELAYEDEXPANSION
:trim_sides
set "str=%~2"
set "delim=%~3"
if "%str%" NEQ "" (
:__loop_trim_sides1__
	set "char=!str:~0,1!"
	call set "check=%%delim:!char!=%%"
	if "!check!" NEQ "!delim!" (
		set "str=!str:~1!"
		goto __loop_trim_sides1__
	)
:__loop_trim_sides2__
	set "char=!str:~-1!"
	call set "check=%%delim:!char!=%%"
	if "!check!" NEQ "!delim!" (
		set "str=!str:~0,-1!"
		goto __loop_trim_sides2__
	)
)
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%str%"
)
GOTO:EOF