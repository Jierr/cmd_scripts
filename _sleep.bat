:_sleep
set "_seconds=%~1"
set /a _seconds+=1

ping 127.0.0.1 -n %_seconds% > nul
GOTO:EOF