:get_timezone
setlocal enabledelayedexpansion


set "timezone="
set utc=utc

for /f "tokens=* delims=" %%a in ('tzutil /g') do (
	set "timezone=%%a"
)

rem echo Timezone=%timezone%
set "prev=^(UTC+00:00^)"

for /f "tokens=* delims=" %%a in ('tzutil /l') do (
	if "%%a" EQU "%timezone%" (
		set "timezone=!prev!"
		if "%2." NEQ "." if "%~2" EQU "true" goto postprocess
		goto done
	)
	set "prev=%%a"
)

:postprocess
call get_enclosed_string  %utc% "%timezone%" "(" ")"
set timezone=%utc%

rem echo UTC=%utc%
:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%timezone%"
)
GOTO:EOF