REM =============================
REM Setup & Variables
REM =============================
set divider======================================
title %appname% %appvers% - %appstat%

REM =============================
REM Admin Permission Checker
REM =============================
@echo off
color %infouicolor%
echo Administrative permissions required. Detecting permissions.
ping localhost -n 2 >NUL
cls
echo Administrative permissions required. Detecting permissions..
ping localhost -n 2 >NUL
cls
echo Administrative permissions required. Detecting permissions...
ping localhost -n 2 >NUL
net session >nul 2>&1
if %errorLevel% == 0 (
echo Administrator privileges found!
echo Starting the program...
ping localhost -n 2 >NUL
goto mainMenu
) else (
cls
color %erruicolor%
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
echo # Current user permissions to execute this .bat file are inadequate.
echo # This .bat file must be run with administrative privileges.
echo # Close this program and run it as administrator.
echo # Contact the developer to assist you...
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
pause
exit
)

REM =============================
REM Main Menu
REM =============================
:mainMenu
cls
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
echo # Type "auto" to initiate auto operation.
echo # Type "exit" to exit the program.
echo #
set/p "mainMenu=# %cliN%> " || set mainMenu=auto
if %mainMenu%==auto goto autoInit
if %addOption%==exit goto exitProgram
pause>null
goto errMes01

REM =============================
REM Error 1 Message Screen
REM =============================
:errMes01
cls
title %appname% %appvers% - %appstat% [ERROR]
echo # %divider%
echo # %appname% %appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %erruicolor%
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
echo # You input an invalid entry please use the specified options.
echo #
echo # ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
echo #
pause>null
goto mainMenu

REM =============================
REM Exit Option Function
REM =============================
:exitProgram
exit