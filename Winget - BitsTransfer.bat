@echo off
setlocal

:: Set working directory
set "TEMP_DIR=%TEMP%\winget_setup"
mkdir "%TEMP_DIR%" 2>nul
cd /d "%TEMP_DIR%"

:: Set the download URL for the ZIP file
set "ZIP_URL=https://github.com/microsoft/winget-cli/releases/download/v1.11.230-preview/DesktopAppInstaller_Dependencies.zip"
set "ZIP_NAME=DesktopAppInstaller_Dependencies.zip"

:: Download the ZIP file using BitsTransfer
echo.
echo Downloading dependencies ZIP...
powershell -Command "Start-BitsTransfer -Source '%ZIP_URL%' -Destination '%ZIP_NAME%'"

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

:: Download and install winget using BitsTransfer
echo.
echo Downloading WinGet...
powershell -Command "Start-BitsTransfer -Source 'https://aka.ms/getwinget' -Destination 'winget.msixbundle'"

:: Install winget
echo.
echo Installing WinGet...
powershell -Command "Add-AppxPackage -Path 'winget.msixbundle'"

echo.
echo ✅ WinGet installation complete.
pause