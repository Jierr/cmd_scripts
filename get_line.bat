:get_line
setlocal enabledelayedexpansion
set "file=%~2"
set "line=%~3"
set __result__=
set curr=1
for /f "delims=" %%a in ('type "!file!"') do (
    if "!curr!"=="%line%" set "__result__=%%a"
    set /a curr+=1
)

(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF