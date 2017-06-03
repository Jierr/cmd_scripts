@echo off
set ms=ms
set sec=sec
set min=min
set hr=hr
set day=day
set month=month
set year=year
set timezone=timezone
set zoffset=zoffset

call get_time "%ms%" "%sec%" "%min%" "%hr%"
call get_date "%day%" "%month%" "%year%"
call get_timezone %timezone% true
call utc2minute_offset %zoffset% "%timezone%"
echo Timezone = %timezone%, offset = %zoffset%
echo %day%.%month%.%year% -- %hr%:%min%:%sec%:%ms%