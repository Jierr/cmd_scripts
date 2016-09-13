:dir_list
SETLOCAL ENABLEDELAYEDEXPANSION
set list=

for /D %%d in (*) do (
	if "!list!"=="" ( set list="%%d"
	) else set list=!list! "%%d"

)

:file_list_end
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%list%"
)
GOTO:EOF