:get_timezone
setlocal enabledelayedexpansion


set "timezone="
set utc=utc

for /f "tokens=* delims=" %%a in ('tzutil /g') do (
	set "timezone=%%a"
)

rem echo Timezone=%timezone%
set prev=

for /f "tokens=* delims=" %%a in ('tzutil /l') do (
	set curr=curr
	call find_substring !curr! "%%a" "%timezone%"
	if !curr! GEQ 0 (
		set "timezone=!prev!"
		if "%2." NEQ "." if "%~2" EQU "true" goto postprocess
		goto done
	)
	set prev=%%a
)

:postprocess
rem echo Timezone=%timezone%
call get_enclosed_string  %utc% "%timezone%" "(" ")"
set timezone=%utc%

rem echo UTC=%utc%
:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%timezone%"
)
GOTO:EOF