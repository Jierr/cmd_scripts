:file_list
SETLOCAL ENABLEDELAYEDEXPANSION
set list=
set suf=
if "%~2"=="" goto __gen

for %%f in (*) do (
	set suf=suf
	set pre=pre
	call file_type suf pre "%%f"
	if "!suf!"=="%~2" (
		if "!list!"=="" ( set list="%%f"
		) else set list=!list! "%%f"
	)
)

goto file_list_end

:__gen
for %%f in (*) do (
	if "!list!"=="" ( set list="%%f"
	) else set list=!list! "%%f"

)
goto file_list_end

:file_list_end
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%list%"
)
GOTO:EOF