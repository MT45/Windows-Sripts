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

:: Install Firefox, MSI Afterburner, and Discord
echo "Installing MSI, Discord, 7-Zip, Steam, Cursor, VLC, Powertoys, Photos, Snip"
winget install Guru3D.Afterburner --silent --accept-package-agreements --accept-source-agreements
winget install Discord.Discord --silent --accept-package-agreements --accept-source-agreements
winget install 7zip.7zip --silent --accept-package-agreements --accept-source-agreements
winget install Valve.Steam --silent --accept-package-agreements --accept-source-agreements
winget install VideoLAN.VLC --silent --accept-package-agreements --accept-source-agreements
winget install Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements
powershell -Command Get-AppxPackage -allusers Microsoft.Windows.Photos
powershell -Command Get-AppxPackage -allusers Microsoft.ScreenSketch

:: Download and replace MSI Afterburner config file
echo "Downloading and replacing MSI Afterburner config file"
curl -L "https://drive.usercontent.google.com/download?id=19JujNK2bk2m9kWkxn_8ZjRXx2kkfWP91&export=download&authuser=0&confirm=t&uuid=d47439d6-9696-4afd-a4fe-ef4244a46e07&at=APcXIO1Wiu9qa_Uw5cNBjh5w8jZS:1770323647187" -o "C:\Program Files (x86)\MSI Afterburner\Profiles\MSIAfterburner.cfg"

pause
