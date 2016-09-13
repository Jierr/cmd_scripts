@echo off

rem set CLFLAGS=
set CFLAGS=
set LFLAGS=

if "%1%"=="" (
	set NAME=out.exe
) else (
	set NAME="%1%"
)

pkg-config --cflags gtk+-3.0 >> cflags
pkg-config --libs gtk+-3.0 > lflags

set /P CFLAGS= < cflags
set CFLAGS=-mwindows %CFLAGS%
set /P LFLAGS= < lflags

echo %CFLAGS%
del cflags
del lflags

rem pkg-config --cflags --libs gtk+-3.0 > pkg.conf
rem set /P CLFLAGS= < pkg.conf
rem del pkg.conf

gcc %CFLAGS% -o %NAME% .\src\*.c %LFLAGS%

rem set CLFLAGS=
set CFLAGS=
set LFLAGS=
set NAME=