REM Usage: call get_time_of_timezone "<timezone>"
REM <timezone>: UTC[+-]hh:mm
:get_time_of_timezone
setlocal enabledelayedexpansion


set "days_in_month=31 28 31 30 31 30 31 31 30 31 30 31"
set "target_zone=%~2"
set ms=ms
set sec=sec
set min=min
set hr=hr
set day=day
set month=month
set year=year
set notleap=0
set current_zone=current_zone
set current_offset=current_offset
set target_offset=target_offset

call get_timezone %current_zone% true

if "%current_zone%" EQU "%target_zone%" (
	call get_time "%ms%" "%sec%" "%min%" "%hr%"
	call get_date "%day%" "%month%" "%year%"
	goto done
)

call utc2minute_offset %current_offset% "%current_zone%"
call utc2minute_offset %target_offset% "%target_zone%"

set /a "target_offset=%target_offset%-%current_offset%"

call get_time "%ms%" "%sec%" "%min%" "%hr%"
call get_date "%day%" "%month%" "%year%"

set /a "nmin=%min%+%target_offset%"
set /a "nhr=%nmin%/60+%hr%
set /a "nmin=%nmin%%%60"
if %nmin% LSS 0 (
	set /a "nmin=%nmin%+60"
)
set /a "nday=%nhr%/24+%day%"
set /a "nhr=%nhr%%%24"
if %nhr% LSS 0 (
	set /a "nhr=%nhr%+24"
	set /a "nday=%nday%-1"
)


set /a "pos=%month%-1"
set /a "pos=%pos%*3"

set /a nmonth=%month%
set /a "day=!days_in_month:~%pos%,2!"
set /a "notleap=%year%%%4"
if %month% EQU 2 if notleap EQU 0 set /a "day+=1"

if %nday% GTR %day% (
	set /a nday=1
	set /a nmonth+=1
) else (
	if %nday% LSS 1 (
		set /a nmonth-=1
		set /a "pos=%nmonth%-1"
		if %pos% LSS 0 set /a pos=11
		set /a "pos=%pos%*3"
		set /a "nday=!days_in_month:~%pos%,2!"
		if %nmonth% EQU 2 if notleap EQU 0 set /a "nday+=1"
	)
)

set nyear=%year%
if %nmonth% GTR 12 (
	set /a nmonth=1
	set /a nyear+=1
) else (
	if %nmonth% LSS 1 (
		set /a nmonth=12
		set /a nyear-=1
	)
)

set /a "min=%nmin%"
set /a "hr=%nhr%"
set /a "day=%nday%"
set /a "month=%nmonth%"
set /a "year=%nyear%"

if "%min:~1,1%"=="" set "min=0%min%"
if "%hr:~1,1%"=="" set "hr=0%hr%"
if "%day:~1,1%"=="" set "day=0%day%"
if "%month:~1,1%"=="" set "month=0%month%"

:done
set "__result__=%year%-%month%-%day% %hr%:%min%:%sec%"
(ENDLOCAL & REM -- RETURN VALUES
    IF "%1." NEQ "." SET "%~1=%__result__%"
)
GOTO:EOF