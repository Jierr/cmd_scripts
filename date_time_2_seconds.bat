:date_time_2_seconds
setlocal enabledelayedexpansion

set "days_in_month=31 28 31 30 31 30 31 31 30 31 30 31"
set date_time=%~2

set syear=1970
set "year=%date_time:~0,4%"
set "month=%date_time:~5,2%"
set "day=%date_time:~8,2%"
set "hr=%date_time:~11,2%"
set "min=%date_time:~14,2%"
set "sec=%date_time:~17,2%"


if "%sec:~0,1%" EQU "0" set /a "sec=%sec:~1,1%"
if "%min:~0,1%" EQU "0" set /a "min=%min:~1,1%"
if "%hr:~0,1%" EQU "0" set /a "hr=%hr:~1,1%"
if "%day:~0,1%" EQU "0" set /a "day=%day:~1,1%"
if "%month:~0,1%" EQU "0" set /a "month=%month:~1,1%"

set /a "_seconds_=%sec%"
set /a "_seconds_+=%min%*60"
set /a "_seconds_+=%hr%*60*60"
set /a "_seconds_+=(%day%-1)*24*60*60"

:m2s
set /a "notleap=%year%%%4"
set /a pos=0
set /a end=%month%-2
if %end% LSS 0 goto y2s
for /l %%m in (0,1,%end%) do (
	set /a pos=%%m
	set /a pos=!pos!*3
	call set /a "d=%%days_in_month:~!pos!,2%%"	
	if %%m EQU 1 if %notleap% EQU 0 set /a "d=!d!+1"
	set /a "_seconds_=!_seconds_!+!d!*24*60*60"
)


set /a "yunix=%year%-1970"
set /a "_seconds_+=%yunix%*365*24*60*60"

set /a "leap_years=(%yunix%+2)/4"
set /a "_seconds_+=%leap_years%*24*60*60"

:done
set /a "__result__=_seconds_"
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%__result__%"
)
GOTO:EOF