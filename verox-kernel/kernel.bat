@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SET missing=0
title LPROD BOOTLOADER (LOOT PRODUCER)
chcp 65001 >nul

:loader
assoc
assoc
assoc
assoc
assoc
assoc
assoc
FOR /L %%i IN (1,1,10) DO (
    IF NOT EXIST "Files\data%%i.krl" (
        echo Files\data%%i.krl is missing >> missing.log
        SET /A missing=!missing!+1
    )
)

IF !missing!==0 (
    goto boot
) ELSE (
    echo FILES INCOMPLETE
    timeout /t 2 /nobreak >nul
    exit /b
)

:boot
cls
title VEROX KERNEL
color 70
timeout /t 1 /nobreak >nul
echo    LOOT PRODUCER BOOTLOADER
echo.
echo    LICENSED TO CRICAT CELCLICK
echo    DEVELOPED BY BATCHMAYNE
echo    PUBLISHED AT GITHUB
echo    OPEN-SOURCE AND FREE
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
