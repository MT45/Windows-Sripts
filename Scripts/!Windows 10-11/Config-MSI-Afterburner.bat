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

:: Download and replace MSI Afterburner config file
echo "Downloading and replacing MSI Afterburner config file"
curl -L "https://drive.usercontent.google.com/download?id=19JujNK2bk2m9kWkxn_8ZjRXx2kkfWP91&export=download&authuser=0&confirm=t&uuid=d47439d6-9696-4afd-a4fe-ef4244a46e07&at=APcXIO1Wiu9qa_Uw5cNBjh5w8jZS:1770323647187" -o "C:\Program Files (x86)\MSI Afterburner\Profiles\MSIAfterburner.cfg"
pause