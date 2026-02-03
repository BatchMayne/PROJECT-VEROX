@echo off
title DOCQ
chcp 65001 >nul
color 5
cd Files
set "error=SORRY YOU GOT ERROR"
set "er1=ERROR FOUND"
set "ersyn=syntax incorrect"

rem set TESTMODE=1
if defined TESTMODE goto main


if "%~1"=="boot" (
	echo.
) else (
	if exist er.krl (
		type er.krl
		timeout /t 2 /nobreak >nul
		exit /b 1
	) else (
		echo %error%
		timeout /t 2 /nobreak >nul
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
set /p input=Enter password: 

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
set /p input="verox@%computername% - > "

if not defined input (
	goto main
)


if /i "%input%"=="cen" (
	echo CEN %ersyn%.
	goto main
)

if /i "%input%"=="clear" (
	cls
	goto main
)

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
	if exist docq.krl (
		type docq.krl
		echo.
		echo.
		echo [ %username% / %computername% ]
		echo.
		echo HOST: DOCQ
		echo VERSION: 1.0
		echo MODE: USER
		echo MODEL: DEFAULT_HOST_MH35
		echo.
		goto main
	) else (
		echo %error%
		goto main
	)
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
	dir
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

if /i "%input%"=="exit" (
	exit
)

if /i "%input%"=="exit /" (
	cd ..
	start kernel.bat
	exit
)

if /i "%input%"=="/ ;" (
	echo the ; command is also called "vice versa command"
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
	echo c me e
	echo spr
	echo ERROR
	exit
)

if /i "%input%"=="cen enter bkstg" (
	echo ARE YOU SURE YOU WANT TO ENTER KERNEL? CLICK ANY KEY TO CONTINUE...
	pause >nul
	cls
	color 0
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


echo "%input%" COMMAND NOT FOUND IN HOST
echo.
goto main

:logq
echo 	 ____   __    ___  __  
echo 	(    \ /  \  / __)/  \ 
echo 	 ) D ((  O )( (__(  O )
echo 	(____/ \__/  \___)\__\)

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
	call "%pkgfile%"
) else (
    echo Package "%pkgname%" not found! extension needed
)
goto main
