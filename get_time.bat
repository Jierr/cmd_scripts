:get_time
setlocal enabledelayedexpansion
set "time=%TIME%"

for /f "tokens=1,2,3,4 delims=:.," %%a in ("%time%") do (
	set "hr=%%a"
	set "min=%%b"
	set "sec=%%c"
	set "ms=%%d"
)

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%ms%"
    IF "%2." NEQ "." SET "%~2=%sec%"
    IF "%3." NEQ "." SET "%~3=%min%"
    IF "%4." NEQ "." SET "%~4=%hr%"
)
GOTO:EOF