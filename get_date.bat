:get_date
setlocal enabledelayedexpansion
set "date=%date%"

for /f "tokens=1,2,3 delims=:.," %%a in ("%date%") do (
	set "day=%%a"
	set "month=%%b"
	set "year=%%c"
)

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%day%"
    IF "%2." NEQ "." SET "%~2=%month%"
    IF "%3." NEQ "." SET "%~3=%year%"
)
GOTO:EOF