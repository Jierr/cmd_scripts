@echo off

echo[
git submodule foreach --recursive git status

echo.
echo.Superproject...
git status

echo[
echo Done!
pause
exit /b 0
