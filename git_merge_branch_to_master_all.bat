@echo off

echo[
echo Wechsle Branch in Submodulen und Superprojekt...
git submodule foreach --recursive git checkout master
if %errorlevel% neq 0 (
	echo Error on switching Branch aborting. Error %errorlevel%
	pause
	exit /b %errorlevel%
)
echo.
echo.Superproject...
git checkout master
if %errorlevel% neq 0 (
	echo Error on switching Branch aborting. Error: %errorlevel%
	pause
	exit /b %errorlevel%
)


set /p branch=Branchname: 

echo[
echo Merge %branch% in Submodule...
git submodule foreach --recursive git merge %branch%
echo Merge %branch% ins Superprojekt...
git merge %branch%

echo[
echo Done!
pause
exit /b 0
