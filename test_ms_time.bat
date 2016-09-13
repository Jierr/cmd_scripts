@echo off
setlocal
chcp 1252 > nul

set mstime=mstime
call ms_time %mstime%

echo.ZEIT = %mstime%
chcp 850 > nul