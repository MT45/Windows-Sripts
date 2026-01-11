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
curl -L "https://drive.usercontent.google.com/download?id=1JovfP-jBnfyOgAa70NLA0x8F5gDivJB6&export=download&authuser=0&confirm=t&uuid=ee90266b-07bf-43e5-a4bb-34202d72788d&at=APcmpoz0MtHY-FPsn-QNkBmYvhhS:1746211652730" -o "C:\Program Files (x86)\MSI Afterburner\Profiles\MSIAfterburner.cfg"