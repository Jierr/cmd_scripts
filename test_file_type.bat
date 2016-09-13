@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 1252 > nul
 
for  %%i in (*) do (
	set prefix=prefix;
	set sufix=sufix;
	call file_type sufix prefix "%%i"
	echo ===================================================
	echo.Prefix	=!prefix!
	echo.Sufix	=!sufix! 
)

:end
endlocal
chcp 850 > nul