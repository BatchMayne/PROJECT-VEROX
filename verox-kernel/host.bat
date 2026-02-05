@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
title DOCQ
color 5
cd Files

set "error=SORRY YOU GOT ERROR"
set "er1=ERROR FOUND"
set "ersyn=syntax incorrect"

if exist tpshell.krl (
	set TESTMODE=1
) else (
	echo.
)
)

if defined TESTMODE goto main


if "%~1"=="boot" (
	echo.
) else (
	if exist er.krl (
		type er.krl
		echo.
		echo IT SEEMS LIKE YOU RUN HOST WITHOUT RUNNING LOOT PRODUCER FIRST
		timeout /t 5 /nobreak >nul
		exit /b 1
	) else (
		echo %error%
		echo.
		echo IT SEEMS LIKE YOU RUN HOST WITHOUT RUNNING LOOT PRODUCER FIRST
		timeout /t 5 /nobreak >nul
		exit /b 1
	)
)

set defaultpass=host

if exist password.txt (
	set /p userpass=<password.txt
) else (
	set userpass=%defaultpass%
)



:login
cls
for /f "delims=" %%i in ('powershell -command "$p = read-host 'Enter password' -assecurestring; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($p))"') do set "input=%%i"
if "%input%"=="%userpass%" (
	timeout /t 2 /nobreak >nul
	cls
	goto main
) else (
	echo %error%
	timeout /t 2 /nobreak >nul
	goto login
)

:main
set "input="
set "promptPath=%cd%"

if /i "%cd:~-5%"=="Files" (
	set "promptPath=~"
)

set /p input="verox@%computername% %promptPath% - > "

if not defined input goto main



if /i "%input%"=="cen" (
	echo CEN %ersyn%.
	goto main
)

if /i "%input%"=="clear" cls & goto main

if /i "%input%"=="cen inl" (
	echo "cen inl" PACKAGE NEEDED
	goto main

)

if /i "%input%"=="cen inl update pckge" (
	if exist pckge.txt (
		echo HOST UPDATE REQUEST >> pckge.krl
		timeout /t 5 /nobreak >nul
		echo UPDATE FINISHED
		goto main
	) else (
		echo ERROR G
		goto main
	)
)

if /i "%input%"=="inl update pckge" (
	echo %er1%
	goto main
)

if /i "%input%"=="tloc" (
	echo BOOTLOADER - LPROD
	goto main

)

if /i "%input%"=="cen /." (
	assoc
	exit

)

if /i "%input%"=="u/" (
	assoc

	goto main
)

if /i "%input%"=="update" (
	echo UPDATE %ersyn%
	goto main

)

if /i "%input%"=="pckge" (
	echo PCKGE %ersyn%
	goto main
)

if /i "%input%"=="inl" (
	echo INL %ersyn%
	echo.
	echo INL [ PACKAGE ]
	goto main
)

if /i "%input%"=="infonet" (
	echo.
	echo ████████▄   ▄██████▄   ▄████████ ████████▄   
	echo ███   ▀███ ███    ███ ███    ███ ███    ███  
	echo ███    ███ ███    ███ ███    █▀  ███    ███  
	echo ███    ███ ███    ███ ███  DOCQ  ███    ███  
	echo ███    ███ ███    ███ ███        ███    ███  
	echo ███    ███ ███    ███ ███    █▄  ███    ███  
	echo ██   ▄███ ███    ███ ███    ███ ███  ▀ ███  
	echo ████████▀   ▀██████▀  ████████▀   ▀██████▀▄█
	echo.
	echo.
	echo [ %username% / %computername% ]
	echo.
	echo HOST: DOCQ
	echo VERSION: 1.0
	echo MODE: USER
	echo MODEL: DEFAULT_HOST_MH35
	echo INDEX: VIXLEN
	echo DEFAULT: DOCQ
	echo.
	goto main
)

if /i "%input%"=="infonet /" (
	echo [ %username% / %computername% ]
	goto main
)

if /i "%input%"=="docq.krl" (
	if exist docq.krl (
		type docq.krl
		echo.
		echo.
		goto main
	) else (
		echo %error%
		goto main
	)

)

if /i "%input%"=="inl pckge" (
	echo %er1%
	goto main
)

if /i "%input%"=="cen inl pckge" (
	echo NO PACKAGE FOUND
	goto main
)

if /i "%input%"=="pckge list" (
	dir /b
	goto main

)

if /i "%input%"=="list" (
	echo LIST %ersyn%
	goto main
)

if /i "%input%"=="pckge list /" (
	dir /r
	goto main
)

if /i "%input%"=="pix" (
	set /p name="Folder name> "
	mkdir "%name%"
	echo Folder created
	goto main
)

if /i "%input%"=="pix /" (
	set /p name="Folder to delete> "
	rd "%name%" /s /q
	echo Folder deleted
	goto main
)

if /i "%input%"=="pix /clean" (
	for /d %%F in (*) do (
		dir "%%F" /b | findstr . >nul || rd "%%F"
	)
	echo Empty folders cleaned
	goto main
)


if /i "%input%"=="backup" (
	set /p folder="Folder to backup> "
	xcopy "%folder%" "%folder%_backup" /e /i /y
	echo Backup created
	goto main
)

if /i "%input%"=="backup /" (
	set /p folder="Folder to restore> "
	xcopy "%folder%_backup" "%folder%" /e /i /y
	echo Folder restored
	goto main
)


if /i "%input%"=="pix ;" (
	echo PIX is a command used to create directory
	echo.
	echo USAGE:
	echo PIX : make directory
	echo PIX / : delete directory
	echo PIX /CLEAN : 
	echo.
	echo RELATED COMMANDS:
	echo.
	echo BACKUP : copy your main directory
	echo BACKUP / : restore folder
	goto main

)

if /i "%input%"=="cen ;" (
	echo CEN is a command used to run commands as DEVELOPER
	goto main
)

if /i "%input%"=="exit" exit

if /i "%input%"=="exit /" (
	cd ..
	color 7
	call kernel.bat
)

if /i "%input%"=="/ ;" (
	echo the / command is also called "vice versa command"
	goto main
)


if /i "%input%"=="docq" (
	echo %error%
	echo.
	echo.
	goto main
)

if /i "%input%"=="mortel" (
	echo mortel
	goto main
)

if /i "%input%"=="cpy" (
	set /p msg="> "
	if not defined msg goto main
	set /p msg="> "
	goto main
)


if /i "%input%"=="fetch" (
	title KERNEL
	cls
	color 7
	assoc
	assoc
	assoc
	assoc
	title DOCQ
	assoc
	assoc
	assoc
	assoc
	title KERNEL
	assoc
	assoc
	assoc
	assoc
	title LPROD
	assoc
	assoc
	assoc
	assoc
	timeout /t 1 /nobreak >nul
	exit
)

if /i "%input%"=="cen enter bkstg" (
	echo ARE YOU SURE YOU WANT TO ENTER KERNEL? CLICK ANY KEY TO CONTINUE...
	pause >nul
	cls
	color 7
	cd ..
	call kernel.bat
)

if /i "%input%"=="bkstg" (
	echo BKSTG %ersyn%
	goto main
)

if /i "%input%"=="lod" (
	goto runpackage
)

if /i "%input%"=="dire" (
	dir /b
	goto main
)

if /i "%input%"=="set dire" (
	goto setdir
)

if /i "%input%"=="cen set dire" (
	goto setdir2
)

if /i "%input%"=="dire mn" (
	cd ..
	goto main
)

if /i "%input:~0,8%"=="strt" (
	goto strt
)


if /i "%input%"=="dire ln" (
	cd
	goto main
)

if /i "%input%"=="vrs" (
	echo VERSION - 1.0
	echo MODEL - DOCQ DEFAULT_HOST_MH35
	goto main
)

if /i "%input%"=="cen cmd" (
	cd ..
	if exist cmd.lnk (
		cls
		title COMMAND PROMPT
		color 7
		call cmd.lnk
	) else (
		echo %error%
		timeout /t 1 /nobreak >nul
		exit
	)
)

if /i "%input%"=="cen teshtmode gpl" (
	if exist tpshell.krl (
		goto main
	) else (
		echo DOCQ WILL EXIT FOR THE CHANGE TO WORK
		echo "token s%%%% &**local DEVELOPER %%%%amb" > tpshell.krl
		timeout /t 5 /nobreak >nul
		exit
	)
)

if /i "%input%"=="cen teshtmode jam" (
	if exist tpshell.krl (
		echo DOCQ WILL EXIT FOR THE CHANGE TO WORK
		del tpshell.krl
		timeout /t 5 /nobreak >nul
		exit
	) else (
		goto main
	)
)

if /i "%input%"=="cen %%lo gkp" (
	echo THIS COMMAND IS NOT ALLOWED FOR SOME REASONS:
	echo.
	echo RUNNING THIS COMMAND WILL DELETE THE HOST
	echo IF YOU WANT TO DELETE THE HOST, THIS COMMAND IS NOT RECOMMENDED
	echo.
	echo IF YOU REALLY WANT TO DELETE HOST, YOU NEED TO ENTER THIS "cen %%lo gkp .n0"
	goto main
)

if /i "%input%"=="cen %%lo gkp .n0" (
	echo EXIT HOST TO CANCEL DELETION
    pause
    echo 4 pause away
    pause
    echo 3 pause away
    pause
    echo 2 pause away
    pause
    echo 1 pause away
    pause
    echo 0 pause away
    timeout /t 10 /nobreak >nul
    start "" cmd /c del "%~f0"
    exit
)

echo "%input%" COMMAND NOT FOUND IN HOST
echo.
goto main

:runpackage
echo PACKAGES:
dir packages /b
echo.
set /p pkgname="PACKAGE NAME> "
if not defined pkgname goto main

set "pkgfile=packages\%pkgname%"

if exist "%pkgfile%" (
	echo Running package: %pkgname%...
	timeout /t 1 /nobreak >nul
	start "%pkgfile%
) else (
	echo Package "%pkgname%" not found! extension needed
)
goto main

:setdir
echo DIRECTORY SHOULD BE INSIDE THE %CD%
set /p dire="DIRECTORY LOCATION> "

if not defined dire goto main

set "direc=%cd%\%dire%"

if exist "%direc%" (
	cd "%direc%"
	echo YOUR DIRECTORY IS %direc%
) else (
	echo %error%
)

goto main

:setdir2
echo [DEV MODE] You can enter any folder
set /p dire="DIRECTORY LOCATION> "

if not defined dire goto main

set "direc=%dire%"

if exist "%direc%" (
	cd "%direc%"
	echo YOUR DIRECTORY IS "%cd%"
) else (
	echo %error%
)

goto main

:strt
set /p strt="PROGRAM> "
set "prog=%strt%"
if not defined strt goto main

if exist "%cd%\%prog%" (
	start "" "%cd%\%prog%"
) else (
	echo %error%
)
goto main