:find_substring
setlocal enabledelayedexpansion
set "str=%~2"
set "sub=%~3"
set __result__=-1
set start=0
set pos=0
set curr_pos=0

:search
if "!str:~%pos%,1!"=="" goto done 
set s=0
set curr_pos=!pos!
:sub
if "!sub:~%s%,1!"=="" goto equal
if "!str:~%curr_pos%,1!" == "" goto done
if "!str:~%curr_pos%,1!" == "!sub:~%s%,1!" (
	set /a s+=1
	set /a curr_pos+=1
	goto sub
)
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