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

:: Install winget
echo "Installing winget"
powershell -Command "Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile winget.msixbundle; Add-AppxPackage winget.msixbundle"

:: Install Firefox, MSI Afterburner, and Discord
echo "Installing Vivaldi, MSI Afterburner, and Discord, 7-Zip, Steam, Kdenlive, OBS, Ghub, Cursor, VLC, Powertoys, Photos, Snip, Minecraft"
winget install Vivaldi.Vivaldi --silent --accept-package-agreements --accept-source-agreements
winget install Guru3D.Afterburner --silent --accept-package-agreements --accept-source-agreements
winget install Discord.Discord --silent --accept-package-agreements --accept-source-agreements
winget install 7zip.7zip --silent --accept-package-agreements --accept-source-agreements
winget install Valve.Steam --silent --accept-package-agreements --accept-source-agreements
winget install KDE.Kdenlive --silent --accept-package-agreements --accept-source-agreements
winget install OBSProject.OBSStudio --silent --accept-package-agreements --accept-source-agreements
winget install Logitech.LogitechGHub --silent --accept-package-agreements --accept-source-agreements
winget install Anysphere.Cursor --silent --accept-package-agreements --accept-source-agreements
winget install VideoLAN.VLC --silent --accept-package-agreements --accept-source-agreements
winget install Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements
powershell -Command Get-AppxPackage -allusers Microsoft.Windows.Photos
powershell -Command Get-AppxPackage -allusers Microsoft.ScreenSketch
powershell -Command Get-AppxPackage -allusers Microsoft.MinecraftUWP

:: Download and replace MSI Afterburner config file
echo "Downloading and replacing MSI Afterburner config file"
curl -L "https://drive.usercontent.google.com/download?id=1JovfP-jBnfyOgAa70NLA0x8F5gDivJB6&export=download&authuser=0&confirm=t&uuid=ee90266b-07bf-43e5-a4bb-34202d72788d&at=APcmpoz0MtHY-FPsn-QNkBmYvhhS:1746211652730" -o "C:\Program Files (x86)\MSI Afterburner\Profiles\MSIAfterburner.cfg"

pause