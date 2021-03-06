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
set dow=dow
call get_day_of_the_week %dow% "%day%" "%month%" "%year%"
echo Day of the week "%dow%"

set "timezone=UTC-12:45"
set zoffset=zoffset
call utc2minute_offset %zoffset% "%timezone%"
echo Timezone = %timezone%, offset = %zoffset%

echo Teste Zeitoffset mit Zeitzonenangabe

set std_time=std_time
call get_time_of_timezone %std_time% "UTC+06:00"
echo %std_time%
set std_time=std_time
call get_time_of_timezone %std_time% "UTC+12:00"
echo %std_time%
set std_time=std_time
call get_time_of_timezone %std_time% "UTC-06:00"
echo %std_time%
set std_time=std_time
call get_time_of_timezone %std_time% "UTC-12:00"
echo %std_time%
set std_time=std_time
call get_time_of_timezone %std_time% "UTC+01:00"
echo %std_time%

set seconds=seconds
call date_time_2_seconds %seconds% "%std_time%"
echo seconds=%seconds%

:end