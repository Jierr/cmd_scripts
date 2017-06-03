:hex_to_int
setlocal enabledelayedexpansion

set "hex=%~2"

if "%hex:~0,2%" EQU "0x" set hex=%hex:~2%
set /a "__result__=0x%hex%

:done
(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF