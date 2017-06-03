@echo off

set hex=hex
set "int=%~1"
set digits=
if "%2." NEQ "." set digits=%~2

echo Mindestens %digits% Ziffern.
call int_to_hex %hex% "%int%" "%digits%"

echo int: "%int%" , hex: "%hex%" 