@echo off
setlocal enabledelayedexpansion

set "filename=%~1"
set n=%~2
set find=find
set lines=lines
set str=

for /f "tokens=*" %%l in ('find /c /v %filename% ""') DO (
	call find_substring %find% "%%l" ":"
	set "str=%%l"
	call set "str=%%str:~!find!%%"
	call find_number %lines% "!str!"
)

rem echo "%filename%" has %lines% lines.

if %n% LSS %lines% (
	set /a lines=%lines%-%n%
) else (
	set lines=0
)

more +%lines% "%filename%"
endlocal