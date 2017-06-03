@echo off
set hex=hex
set int=%~1

call int_to_hex %hex% "%int%"

echo int: "%int%", hex: "%hex%"