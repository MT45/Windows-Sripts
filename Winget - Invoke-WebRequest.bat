@echo off
setlocal

:: Set working directory
set "TEMP_DIR=%TEMP%\winget_setup"
mkdir "%TEMP_DIR%" 2>nul
cd /d "%TEMP_DIR%"

:: Set the download URL for the ZIP file
set "ZIP_URL=https://github.com/microsoft/winget-cli/releases/download/v1.11.230-preview/DesktopAppInstaller_Dependencies.zip"
set "ZIP_NAME=DesktopAppInstaller_Dependencies.zip"

:: Download the ZIP file using PowerShell
echo.
echo Downloading dependencies ZIP...
powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_NAME%'"

:: Check if the download was successful
if not exist "%ZIP_NAME%" (
    echo Failed to download ZIP file.
    pause
    exit /b 1
)

:: Extract the ZIP file
echo.
echo Extracting ZIP...
powershell -Command "Expand-Archive -Path '%ZIP_NAME%' -DestinationPath . -Force"

:: Install both .appx files found in DesktopAppInstaller_Dependencies\x64
echo.
echo Installing dependencies...
for %%f in ("%TEMP_DIR%\DesktopAppInstaller_Dependencies\x64\*.appx") do (
    powershell -Command "Add-AppxPackage -Path '%%f'"
)

:: Download and install winget
echo.
echo Installing WinGet...
powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/getwinget' -OutFile 'winget.msixbundle'; Add-AppxPackage 'winget.msixbundle'"

echo.
echo ✅ WinGet installation complete.
pause
