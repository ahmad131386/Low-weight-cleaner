@echo off
:: Batch Script with User Options

:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as administrator!
    pause
    exit
)

:menu
cls
echo ======================================
echo     System Maintenance Script
echo ======================================
echo Choose an option:
echo 1. Clear Temporary Files
echo 2. Empty Recycle Bin
echo 3. Flush DNS Cache
echo 4. Perform All Tasks
echo 5. Exit
set /p choice=Enter your choice (1-5): 

if "%choice%"=="1" goto clear_temp
if "%choice%"=="2" goto clear_recycle
if "%choice%"=="3" goto flush_dns
if "%choice%"=="4" goto all_tasks
if "%choice%"=="5" exit

:: Invalid input
echo Invalid choice! Please try again.
pause
goto menu

:clear_temp
echo Clearing temporary files...
del /s /q "%temp%\*" >nul
rd /s /q "%temp%" >nul
mkdir "%temp%"
echo Temporary files cleared.
pause
goto menu

:clear_recycle
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul
echo Recycle Bin emptied.
pause
goto menu

:flush