:utc2minute_offset
setlocal enabledelayedexpansion

set "utc=%~2"
set /a hour=%utc:~4,2%
set /a min=%utc:~7,2%
set /a "offset=%hour%*60+%min%"

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%offset%"
)
GOTO:EOF