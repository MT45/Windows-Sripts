@echo off
setlocal

:: Set working directory
set "TEMP_DIR=%TEMP%\winget_setup"
mkdir "%TEMP_DIR%" 2>nul
cd /d "%TEMP_DIR%"

:: Download and install winget using BitsTransfer
echo.
echo Downloading WinGet...
powershell -Command "Start-BitsTransfer -Source https://aka.ms/getwinget -Destination winget.msixbundle"


:: Install winget
echo.
echo Installing WinGet...
powershell -Command "Add-AppPackage ./winget.msixbundle"

echo.
echo ✅ WinGet installation complete.
pause