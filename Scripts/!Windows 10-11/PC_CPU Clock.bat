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

:: Configure Balanced Power Plan processor settings
echo "Configuring Balanced Power Plan processor settings..."
powercfg /setacvalueindex SCHEME_BALANCED SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 0
powercfg /setacvalueindex SCHEME_BALANCED SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg /setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 0
powercfg /setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 100

:: Configure High Performance Power Plan processor settings
echo "Configuring High Performance Power Plan processor settings..."
powercfg /setacvalueindex SCHEME_MIN SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 83
powercfg /setacvalueindex SCHEME_MIN SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 83
powercfg /setdcvalueindex SCHEME_MIN SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 83
powercfg /setdcvalueindex SCHEME_MIN SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 83

:: Apply changes
powercfg /changename SCHEME_BALANCED "Balanced" "System balanced power plan with 0-100% processor states"
powercfg /changename SCHEME_MIN "High performance" "High performance power plan with 83% processor states"

echo "Power plan processor settings have been configured."

:: Create shortcuts on desktop to activate power plans
echo "Creating desktop shortcuts for power plans..."

:: link to icon index 
:: https://www.tiger-222.fr/?d=2019/10/01/10/18/05-icones-de-imageresdll-et-shell32dll

:: Create Balanced Power Plan shortcut
powershell -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut(\"$env:USERPROFILE\Desktop\4.7-GHz.lnk\");$s.TargetPath='cmd.exe';$s.Arguments='/c powercfg /setactive SCHEME_BALANCED';$s.IconLocation=\"%SystemRoot%\System32\SHELL32.dll,77\";$s.Save()"

:: Create High Performance Power Plan shortcut
powershell -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut(\"$env:USERPROFILE\Desktop\3.00-GHz.lnk\");$s.TargetPath='cmd.exe';$s.Arguments='/c powercfg /setactive SCHEME_MIN';$s.IconLocation=\"%SystemRoot%\System32\SHELL32.dll,27\";$s.Save()"

pause
