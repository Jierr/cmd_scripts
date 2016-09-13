@echo off

set /p branch=Branchname: 

echo[
echo Erzeuge und tracke Branch in Submodulen...
git submodule foreach --recursive "git branch --track %branch% origin/%branch% || :"
git submodule foreach --recursive "git branch %branch% || :"
echo Erzeuge und tracke Branch im Superprojekt...
git branch --track %branch% origin/%branch%
echo.
echo.Superproject...
git branch %branch%

echo[
echo Done!
pause
