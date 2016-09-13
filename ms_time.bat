:ms_time
SETLOCAL 
set "time=%TIME%"
set __result__=
for /f "tokens=1,2,3,4 delims=:.," %%a in ("%time%") do (
	set "hr=%%a"
	set "min=%%b"
	set "sec=%%c"
	set "ms=%%d"
)
for /f "tokens=* delims=0" %%h in ("%hr%") do set /a "hr=%%h"
for /f "tokens=* delims=0" %%h in ("%min%") do set /a "min=%%h"
for /f "tokens=* delims=0" %%h in ("%sec%") do set /a "sec=%%h"
for /f "tokens=* delims=0" %%h in ("%ms%") do set /a "ms=%%h"

set /a "__result__= %ms% + 100* %sec% + 60*100*%min% + 60*60*100*%hr%"

(ENDLOCAL & REM -- RETURN VALUES
	IF "%~1" NEQ "" SET "%~1=%__result__%"
)
GOTO:EOF