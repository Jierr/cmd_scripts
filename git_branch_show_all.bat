@echo off

echo[
git submodule foreach --recursive git branch -a

echo.
echo.Superproject...
git branch -a

echo[
echo Done!
pause
exit /b 0
