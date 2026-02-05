@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
title LPROD BOOTLOADER (LOOT PRODUCER)
chcp 65001 >nul
set "error=SORRY YOU GOT ERROR"

:loader
assoc
assoc
assoc
assoc
assoc
assoc
assoc
goto 1

:boot
cls
title VEROX KERNEL
color 70
timeout /t 1 /nobreak >nul
echo	LOOT PRODUCER BOOTLOADER
echo.
echo	LICENSED TO CRICAT CELCLICK
echo	DEVELOPED BY BATCHMAYNE
echo	PUBLISHED AT GITHUB
echo OPEN-SOURCE AND FREE
echo.
echo == 1) - DOCQ DEFUALT_HOST_MH35
echo == 2) - DIRECTORY
echo == 3) - RETURN
echo == 4) - EXIT
echo.
set /p input="BOOTLOADER OPTION> "

if /i "%input%"=="1" (
if exist "host.bat" (
	cls
	timeout /t 5 /nobreak >nul
	color 5
	call "host.bat" boot
) else (
	color 47
	echo NO HOST FOUND !
	timeout /t 1 /nobreak >nul
	tasklist
	timeout /t 1 /nobreak >nul
	exit
)
)

if /i "%input%"=="2" (
	cd Files
	explorer .
	exit
)

if /i "%input%"=="3" (
	color 7
	goto loader
)

if /i "%input%"=="4" (
	exit
)

if /i "%input%"=="gl_index_dev" (
	echo DEVELOPMENT ALREADY WRAPPED.
	echo THIS COMMAND IS REMOVED
	pause
	exit
)

echo INVALID INPUT @
pause
goto boot

:1
cd Files
if exist data1.krl (
	goto 2
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)

:2
if exist data2.krl (
	goto 3
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:3
if exist data3.krl (
	goto 4
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:4
if exist data4.krl (
	goto 5
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:5
if exist data5.krl (
	goto 6
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:6
if exist data6.krl (
	goto 7
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:7
if exist data7.krl (
	goto 8
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:8
if exist data8.krl (
	goto 9
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:9
if exist data9.krl (
	goto 10
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)


:10
if exist data10.krl (
	cd ..
	goto boot
) else (
	echo %error%
	timeout /t 1 /nobreak >nul
	exit
)