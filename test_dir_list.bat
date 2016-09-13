@echo off
setlocal
chcp 1252 > nul

set dlist=dlist

call dir_list dlist ""
echo %dlist%
echo. 
for %%i in (%dlist%) do (
	echo %%~i
)


:end
chcp 850 > nul
endlocal