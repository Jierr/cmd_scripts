REM Usage: call get_time_of_timezone "<set result=result> <day> <month> <year>"
REM return Day of the week (sunday=0)
:get_day_of_the_week
setlocal enabledelayedexpansion

set day=%~2
set month=%~3
set year=%~4

set "days_in_month=31 28 31 30 31 30 31 31 30 31 30 31"
set syear=1970
set sday=1
set smonth=1
set sdow=4
set /a days=0

if "%day:~0,1%" EQU "0" set /a "day=%day:~1,1%"
if "%month:~0,1%" EQU "0" set /a "month=%month:~1,1%"

REM ================= Calc Days in Months ==============================
if "%month%" EQU "1" goto calc_dow
set /a "pos=%month%-2"
set /a "pos=%pos%*3"
set /a "notleap=%year%%%4"
for /l %%m in (0,3,%pos%) do (
	call set /a "curr=%%days_in_month:~%%m,2%%"
	set /a "days=!days!+!curr!"
	if %%m EQU 1 if %notleap% EQU 0 set /a "days=!days!+1"
)

REM ================= Calc DOW ==============================
:calc_dow
set /a "tmp=%year%-%syear%"
set /a "days=%days%+%tmp%*365+%day%-1"
set /a "tmp=(%tmp%+2)/4"
set /a "days+=%tmp%"
set /a "sdow=(%sdow%+%days%)%%7"


:done
set __result__=%sdow%
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%__result__%"
)
GOTO:EOF