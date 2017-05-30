:find_all_numbers
setlocal enabledelayedexpansion
set "str=%~2"
set __result__=
set pos=0
set digits=0123456789

:search
if "!str:~%pos%,1!"=="" goto done 
set d=0
:isdigit
if "!digits:~%d%,1!"=="" goto isnodigit
if "!str:~%pos%,1!" NEQ "!digits:~%d%,1!" (
	set /a d+=1
	goto isdigit
)
set "__result__=!__result__!!str:~%pos%,1!"
set /a pos+=1
goto search

:isnodigit
if "!__result__!" NEQ "" (
	if "!__result__:~-1,1!" NEQ " " set "__result__=!__result__! "
)
set /a pos+=1
goto search

	
:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF