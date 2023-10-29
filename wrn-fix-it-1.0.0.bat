rem =============================
rem WRN Fix IT - https://github.com/warengonzaga/wrn-fix-it#readme
rem Your Windows companion toolset for fixing common issues
rem Version: 1.0.0
rem Github: https://github.com/warengonzaga/wrn-fix-it
rem Licensed under GPL v3 - https://opensource.org/licenses/GPL-3.0
rem Copyright (c) 2023 Waren Gonzaga
rem 
rem Facebook: @warengonzagaofficial
rem Twitter: @warengonzaga
rem Github: @warengonzaga
rem Website: warengonzaga.com
rem 
rem Donate or Support!
rem https://buymeacoff.ee/warengonzaga
rem =============================

cls
@echo off
rem =============================
rem Setup Variables
rem =============================
set appname=WRN Fix IT
set appvers=1.0.0
set appstat=Alpha
set dev=Waren Gonzaga
set desc=Your Windows companion toolset for fixing common issues
set uicolor=a
set infouicolor=b
set erruicolor=c
set cliname=$%appname%
set divider======================================
title %appname% v%appvers% - %appstat%

rem =============================
rem Admin Permission Checker
rem =============================
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
    echo # %appname% v%appvers% - %appstat%
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

rem =============================
rem Main Menu
rem =============================
:mainMenu
cls
title %appname% v%appvers% - %appstat% [Main Menu]
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # %desc%
echo # %divider%
echo #
echo # Tools ...................... [1] (enter)
echo # Modules .................... [2] (coming soon)
echo # Donate ..................... [3]
echo # Exit ....................... [4]
echo #
set/p "mainMenu=# %cliname%> " || set mainMenu=1
if %mainMenu%==1 goto toolsMenu
if %mainMenu%==2 goto modulesMenu
if %mainMenu%==3 goto donate
if %mainMenu%==4 || if %mainMenu%==exit goto exitProgram
goto err2
pause>null

rem =============================
rem Tools Menu
rem =============================
:toolsMenu
del null
cls
title %appname% v%appvers% - %appstat% [Tools]
color %uicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # DNS Server Changer ......... [1]
echo # Back to Main Menu .......... [2] (enter)
echo #
set/p "toolsMenu=# %cliname%> " || set toolsMenu=2
if %toolsMenu%==1 goto t001
if %toolsMenu%==2 goto mainMenu
goto err2
pause>null

rem =============================
rem Tools: DNS Server Changer
rem =============================
:t001
del null
cls
title %appname% v%appvers% - %appstat% [DNS Server Changer]
color %uicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # Default / DHCP ............. [0]
echo # Google DNS ................. [1]
echo # Cloudflare DNS ............. [2]
echo # Freenome DNS ............... [3]
echo # Comodo DNS ................. [4]
echo # Quad9 DNS .................. [5]
echo # Verisign DNS ............... [6]
echo # OpenDNS .................... [7]
echo # Back ....................... [8] (enter)
echo #
set/p "t001_option=# %cliname%> " || set t001_option=4
rem some algo
if %t001_option% equ 0 (
    rem default / dhcp
    set t001_d0=1
    goto t001_1
)
if %t001_option% equ 1 (
    rem Google Public DNS
    set t001_d0=0
    set t001_d1=8.8.8.8
    set t001_d2=8.8.4.4
    goto t001_1
)
if %t001_option% equ 2 (
    rem Cloudflare DNS
    set t001_d0=0
    set t001_d1=1.1.1.1
    set t001_d2=1.0.0.1
    goto t001_1
)
if %t001_option% equ 7 (
    rem Freenom DNS
    set t001_d0=0
    set t001_d1=80.80.80.80
    set t001_d2=80.80.81.81
    goto t001_1
)
if %t001_option% equ 4 (
    rem Comodo Secure DNS
    set t001_d0=0
    set t001_d1=8.26.56.26
    set t001_d2=8.20.247.20
    goto t001_1
)
if %t001_option% equ 5 (
    rem Quad9 DNS
    set t001_d0=0
    set t001_d1=9.9.9.9
    set t001_d2=149.112.112.112
    goto t001_1
)
if %t001_option% equ 6 (
    rem Verisign DNS
    set t001_d0=0
    set t001_d1=64.6.64.6
    set t001_d2=64.6.65.6
    goto t001_1
)
if %t001_option% equ 7 (
    rem OpenDNS
    set t001_d0=0
    set t001_d1=208.67.222.222
    set t001_d2=208.67.220.220
    goto t001_1
)
if %t001_option% equ 8 goto toolsMenu
goto err2
pause>null

rem =============================
rem Tools: DNS Server Changer
rem =============================
:t001_1
del null
cls
title %appname% v%appvers% - %appstat% [DNS Server Changer]
color %uicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # Select the network you want to change the DNS server.
echo # Note: Interface names are case-sensitive.
echo # %divider%
netsh interface ip show config
echo # %divider%
echo #
set/p "t001_2_option=# %cliname%> " || goto err2
echo #
echo # Updating ...
netsh interface ip set dnsservers "%t001_2_option%" dhcp
if %errorlevel% neq 1 (
    if %t001_d0%==0 netsh interface ip set dnsservers "%t001_2_option%" static %t001_d1% primary
    if %t001_d0%==0 netsh interface ip add dnsservers "%t001_2_option%" %t001_d2% index=2
) else (
    goto err3
)
cls
title %appname% v%appvers% - %appstat% [DNS Server Changer]
color %uicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo #
echo # DNS Server successfuly changed!
echo #
echo # %divider%
echo #
echo # Press any key to continue... (except power button lol)
pause>null
goto toolsMenu

rem =============================
rem Modules Menu
rem =============================
:modulesMenu
del null
cls
title %appname% v%appvers% - %appstat% [Not Available]
color %uicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # Currently not available!
echo # %divider%
echo #
echo # Press any key to continue... (except power button lol)
pause>null
goto mainMenu

rem =============================
rem Donation
rem =============================
:donate
del null
cls
title %appname% v%appvers% - %appstat% [Donate]
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
color %uicolor%
echo # Donate and Support
echo # %divider%
echo #
echo # Do you like this tool? 
echo # Please consider to buy me a coffee or
echo # just donate to keep this project alive.
echo #
echo # Buy Me A Coffee ............ [1]
echo # GitHub Sponsors ............ [2]
echo # Back to Main Menu .......... [3] (enter)
echo #
set /p "donate=# %cliname%> " || set donate=3
if %donate%==1 goto buymeacoffee
if %donate%==2 goto sponsors
if %donate%==3 goto mainMenu
goto err2
pause>null

rem =============================
rem Donation: BMC
rem =============================
:buymeacoffee
start https://buymeacoff.ee/warengonzaga
goto donate

rem =============================
rem Donation: GitHub Sponsors
rem =============================
:sponsors
start https://github.com/sponsors/warengonzaga
goto donate

rem =============================
rem Error 1 Message Screen
rem =============================
:err1
cls
title %appname% v%appvers% - %appstat% [Error Code 1]
echo # %divider%
echo # %appname% v%appvers% - %appstat%
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

rem =============================
rem Error 2 Message Screen
rem =============================
:err2
del null
cls
title %appname% v%appvers% - %appstat% [Error Code 2]
color %erruicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # Invalid option! Please try again...
echo # %divider%
echo #
echo # Press any key to continue... (except power button lol)
pause>null
goto mainMenu

rem =============================
rem Error 2 Message Screen
rem =============================
:err3
del null
cls
title %appname% v%appvers% - %appstat% [Error Code 3]
color %erruicolor%
echo # %divider%
echo # %appname% v%appvers% - %appstat%
echo # by %dev%
echo # %divider%
echo # The selected network doesn't exist!
echo # Keep in mind that the network names are case sensitive.
echo # %divider%
echo #
echo # Press any key to continue... (except power button lol)
pause>null
goto mainMenu

rem =============================
rem Exit Option Function
rem =============================
:exitProgram
exit