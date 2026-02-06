@echo off
:: Check if running as admin
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Not running as admin. Relaunching as admin...
    PowerShell -ExecutionPolicy Bypass -Command "& {Start-Process -FilePath '%~f0' -Verb RunAs}"
    EXIT /B
)

:: If we're here, we ARE running as admin — continue below
ECHO Running as administrator!
:: Your batch file commands here...

:: ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------- Install winget --------------------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

:: Install PowerToys, Photos, Snip
echo "PowerToys, Photos, Snip"
winget install Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements
powershell -Command Get-AppxPackage -allusers Microsoft.Windows.Photos
powershell -Command Get-AppxPackage -allusers Microsoft.ScreenSketch

pause