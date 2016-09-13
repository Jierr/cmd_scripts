@echo off
setlocal
chcp 1252 > nul

set "file=%~1"
set "line=%~2"
set return=return

call get_line %return% "%file%" "%line%"

echo.Zeile %line% enthält den String "%return%"
goto end
:end
chcp 850 > nul