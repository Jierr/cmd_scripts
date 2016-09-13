@echo off
setlocal
chcp 1252 > nul


set "str=%~1"
set "delim=%~2"
echo.Delimiter is "%delim%"
if "%delim%"=="" (
	echo.No Delimiter
	set "delim=	 "
)
echo.Delimiter is "%delim%"
set trim=trim

SETLOCAL ENABLEDELAYEDEXPANSION
set str=!str:%%=%%%%!
echo."%str%" > trim.txt

call trim_sides %trim% "%str%" "%delim%"

echo."%trim%" >> trim.txt
echo."[%str%] --> [%trim%]"
goto end
:end
chcp 850 > nul