@echo off
setlocal
chcp 1252 > nul

set flist=flist

echo ==================List all ...
call file_list flist ""
echo %flist%
echo. 
for %%i in (%flist%) do (
	echo %%~i
)

echo ==================List *.txt ...
call file_list flist "txt"
echo %flist%
echo. 
for %%i in (%flist%) do (
	echo %%~i
)


:end
chcp 850 > nul
endlocal