@echo off

call "git_checkout_to_branch_all.bat"
if %errorlevel% neq 0 (
	echo Error on switching Branch aborting. Error %errorlevel%
	pause
	exit /b %errorlevel%
)

echo[
echo Merge Master in Submodulen...
git submodule foreach --recursive git merge master
echo Merge Master im Superprojekt...
git merge master

echo[
echo Done!
pause
exit /b 0
