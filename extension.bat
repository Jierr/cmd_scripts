@echo off
setlocal ENABLEDELAYEDEXPANSION

chcp 1252 > nul
set change=
call file_list change "%~1"

if "%~1"=="" (
    echo.no source type specified....
    goto end
)

if "%~2"=="" (
    echo.no final type specified....
    goto end
)

echo.Change all *.%1 to *.%2 ....
for  %%i in (!change!) do (
	set "prefix="
	set "sufix="
    set "filename=%%~i"
    call file_type sufix prefix "!filename!"
	if "!sufix!"=="%~1" rename "!filename!" "!prefix!.%2"
)
goto end

:end
set filename=

chcp 850 > nul
endlocal