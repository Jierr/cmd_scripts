@echo off

set /p branch=Branchname: 

echo[
echo Wechsle Branch in Submodulen und Superprojekt...
git submodule foreach --recursive git checkout %branch%
if %errorlevel% neq 0 (
	echo Error on switching Branch aborting. Error %errorlevel%
	pause
	exit /b %errorlevel%
)
echo.
echo.Superproject...
git checkout %branch%
if %errorlevel% neq 0 (
	echo Error on switching Branch aborting. Error: %errorlevel%
	pause
	exit /b %errorlevel%
)

git submodule foreach --recursive "git push -u origin %branch% || :"
git push -u origin %branch%


echo[
echo Done!
pause
exit /b 0


