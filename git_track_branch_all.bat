@echo off

set /p branch=Branchname: 

echo[
echo Erzeuge und tracke Branch in Submodulen...
git submodule foreach --recursive "git branch --set-upstream-to=origin/%branch% %branch% || :"
rem git submodule foreach --recursive "git branch %branch% || :"
echo Erzeuge und tracke Branch im Superprojekt...
git branch --set-upstream-to=origin/%branch% %branch%
rem git branch %branch%

echo[
echo Done!
pause
