:find_number
setlocal enabledelayedexpansion
set "str=%~2"
set __result__=
set pos=0
set digits=0123456789

:search
rem echo !str:~%pos%,1!
if "!str:~%pos%,1!"=="" goto done 
set d=0
:isdigit
if "!digits:~%d%,1!"=="" goto isnodigit
rem echo Is "!str:~%pos%,1!" a digit?
if "!str:~%pos%,1!" NEQ "!digits:~%d%,1!" (
	set /a d+=1
	goto isdigit
)
rem echo YES!
set "__result__=!__result__!!str:~%pos%,1!"
set /a pos+=1
goto search

:isnodigit
rem echo NO!
if "!__result__!" NEQ "" goto done
set /a pos+=1
goto search

	
:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF