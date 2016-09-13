@echo off

set string="%~1"

del __file_list.txt
del __result.txt

for /r %%i in (*) do (
	echo %%i >> __file_list.txt
)

findstr /C:%string%   /F:__file_list.txt > __result.txt
