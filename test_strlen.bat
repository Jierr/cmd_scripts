setlocal
@echo off
chcp 1252 > nul


set "str=%~1"
set return=return

call strlen return "%str%"

echo.Die Länge des Strings "%str%" ist %return%
goto end
:end
chcp 850 > nul