@echo off

set /p branch=Branchname: 

echo[
echo Lösche Branch in Submodulen und Superprojekt...
git submodule foreach --recursive "git branch -d %branch% || :"
rem git submodule foreach --recursive "git push origin :%branch% || :"
echo.
echo.Superproject...
git branch -d %branch%
rem git push origin :%branch%


rem git push origin :<branchName>
echo[
echo Done!
pause
