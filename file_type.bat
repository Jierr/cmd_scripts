:file_type
SETLOCAL ENABLEDELAYEDEXPANSION
set "pre=%~3"
set suf=

:subst
if "!pre:~-1!" NEQ "." (
    set "suf=!pre:~-1!!suf!"
    set "pre=!pre:~0,-1!"
	rem echo !pre!
	if "!pre!"=="" goto no_sufix
    goto subst
)
set pre=!pre:~0,-1!
goto local_end
rem echo prefix: [%pre%]
rem echo suffix: [%suf%]
:no_sufix
set "pre=%~3"
set suf=
:local_end
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~2=%pre%"
    IF "%~2" NEQ "" SET "%~1=%suf%"
)
GOTO:EOF