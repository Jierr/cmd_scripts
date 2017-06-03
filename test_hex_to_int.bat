@echo off
set hex=ffff
set int=int

call hex_to_int %int% "%hex%"
echo "%hex%" = %int%
set hex=0x10000
set int=int
call hex_to_int %int% "%hex%"
echo "%hex%" = %int%