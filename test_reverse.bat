@echo off
setlocal
chcp 1252 > nul


set "str=%~1"
set return=xx

echo.String to reverse "%str%"
call reverse return "%str%"

echo.Die Umkehrung des Strings "%str%" ist "%return%"
goto end
:end
chcp 850 > nul