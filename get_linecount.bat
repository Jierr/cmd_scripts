:get_linecount
setlocal enabledelayedexpansion

set "filename=%~2"
set find=find
set lines=lines
set str=

for /f "tokens=*" %%l in ('find /c /v %filename% ""') DO (
	call find_substring %find% "%%l" ":"
	set "str=%%l"
	call set "str=%%str:~!find!%%"
	call find_number %lines% "!str!"
)

set "__result__=%lines%"

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF