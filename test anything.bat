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

echo Disable Windows Defender through registry modifications

echo Disable core Windows Defender functionality
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f

echo Disable all real-time protection features
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f

echo Disable cloud-based protection and sample submission
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f

echo Disable automatic engine updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" /v MpEnablePus /t REG_DWORD /d 0 /f

echo Suppress Windows Defender notifications
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress /t REG_DWORD /d 1 /f

echo Disable Windows Defender service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f

echo Disabling Windows Defender notifications...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f

echo Notify user and wait for input
echo Windows Defender has been disabled. Please restart your computer for changes to take effect.
pause














@echo off
:: Check if running as admin
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Not running as admin. Relaunching as admin...
    PowerShell -ExecutionPolicy Bypass -Command "& {Start-Process -FilePath '%~f0' -Verb RunAs}"
    echo Press any key to close this window...
    pause
    EXIT /B
)

:: If we're here, we ARE running as admin — continue below
ECHO Running as administrator!
:: Your batch file commands here...
echo Disable Windows Defender through registry modifications

echo Disable core Windows Defender functionality
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f

echo Disable all real-time protection features
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f

echo Disable cloud-based protection and sample submission
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f

echo Disable automatic engine updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" /v MpEnablePus /t REG_DWORD /d 0 /f

echo Suppress Windows Defender notifications
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress /t REG_DWORD /d 1 /f

echo Disable Windows Defender service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f

echo Disabling Windows Defender notifications...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f

:: Attempt to stop Defender services (may require Safe Mode)
echo Attempting to stop and disable Defender services...
sc stop WinDefend
sc config WinDefend start= disabled
sc stop Sense
sc config Sense start= disabled
sc stop WdNisSvc
sc config WdNisSvc start= disabled

:: Attempt to take ownership and deny execution of MsMpEng.exe (advanced, may break updates)
echo Attempting to deny execution of Antimalware Service Executable (MsMpEng.exe)...
takeown /f "%ProgramFiles%\Windows Defender\MsMpEng.exe" /a
icacls "%ProgramFiles%\Windows Defender\MsMpEng.exe" /deny Everyone:(X)

echo Notify user and wait for input
echo ======================================================
echo Windows Defender has been (best effort) disabled.
echo If you see errors, reboot into Safe Mode and re-run.
echo Some protections may re-enable after Windows Update.
echo For full removal, consider third-party tools or scripts.
echo ======================================================
pause

echo Script complete. Press any key to exit.
pause
EXIT /B

















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

:: ===================== SAFETY & WARNINGS =====================
echo ======================================================
echo   IMPORTANT: Disable Tamper Protection manually first!
echo   Open Windows Security > Virus & threat protection >
echo   Manage settings > Turn off Tamper Protection.
echo   This script will NOT work if Tamper Protection is ON.
echo ======================================================
echo   It is highly recommended to create a System Restore Point or backup before proceeding!
echo ======================================================

pause

:: ===================== MENU =====================
:menu
echo.
echo Windows Defender Removal/Disable Script
set "choice="
echo [1] Best-effort disable Defender (registry/services)
echo [2] Aggressive removal (delete files, folders, registry, UWP app)
echo [3] Exit
echo.
set /p choice="Choose an option [1-3]: "
if "%choice%"=="1" goto besteffort
echo %choice%|findstr /b /c:2 >nul && goto aggressive
if "%choice%"=="3" exit /b

echo Invalid choice. Try again.
goto menu

:: ===================== BEST-EFFORT DISABLE =====================
:besteffort
echo Applying registry tweaks to disable Defender...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" /v MpEnablePus /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f

:: Additional registry keys for Windows 11
echo Applying additional registry keys for Windows 11...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f

echo Attempting to stop and disable Defender services...
sc stop WinDefend
sc config WinDefend start= disabled
sc stop Sense
sc config Sense start= disabled

echo Attempting to take ownership and rename MsMpEng.exe (may require Safe Mode)...
takeown /f "%ProgramFiles%\Windows Defender\MsMpEng.exe"
icacls "%ProgramFiles%\Windows Defender\MsMpEng.exe" /grant administrators:F
ren "%ProgramFiles%\Windows Defender\MsMpEng.exe" MsMpEng.exe.bak

echo.
echo Best-effort disable complete. Please restart your computer.
goto end

:: ===================== AGGRESSIVE REMOVAL =====================
:aggressive
echo Aggressive removal selected.
echo Checking for PowerRun.exe...
if exist "%~dp0PowerRun.exe" (
    set "PR=PowerRun.exe"
    echo PowerRun.exe found. Will use for privileged actions.
) else (
    set "PR="
    echo PowerRun.exe NOT found. Will use normal privileges.
)

:: Remove Windows Security UWP App if script exists
echo Attempting to remove Windows Security UWP App...
if exist "%~dp0RemoveSecHealthApp.ps1" (
    PowerShell -noprofile -executionpolicy bypass -file "%~dp0RemoveSecHealthApp.ps1"
) else (
    echo RemoveSecHealthApp.ps1 not found, skipping UWP app removal.
)

:: Bulk registry import from Remove_defender and Remove_SecurityComp folders
if exist "%~dp0Remove_defender" (
    for %%f in ("%~dp0Remove_defender\*.reg") do (
        if defined PR (
            %PR% regedit.exe /s "%%f"
        ) else (
            regedit.exe /s "%%f"
        )
    )
)
if exist "%~dp0Remove_SecurityComp" (
    for %%f in ("%~dp0Remove_SecurityComp\*.reg") do (
        if defined PR (
            %PR% regedit.exe /s "%%f"
        ) else (
            regedit.exe /s "%%f"
        )
    )
)

:: Aggressive file/folder deletion (best effort)
echo Attempting to delete Defender-related files and folders...
set filesToDelete="%ProgramFiles%\Windows Defender\MsMpEng.exe" "%ProgramFiles%\Windows Defender\MpCmdRun.exe" "%ProgramFiles%\Windows Defender\NisSrv.exe" "%ProgramFiles%\Windows Defender\MpAsDesc.dll" "%ProgramFiles%\Windows Defender\MpClient.dll" "%ProgramFiles%\Windows Defender\MpOAV.dll" "%ProgramFiles%\Windows Defender\MpSvc.dll" "%ProgramFiles%\Windows Defender\MpUXSrv.exe" "%ProgramFiles%\Windows Defender\MsMpEng.exe.bak"
for %%d in (%filesToDelete%) do (
    if defined PR (
        %PR% cmd.exe /c del /f /q %%d
    ) else (
        del /f /q %%d
    )
)

:: Attempt to remove Defender folders
set foldersToDelete="%ProgramFiles%\Windows Defender" "%ProgramFiles(x86)%\Windows Defender" "%ProgramData%\Microsoft\Windows Defender" "%ProgramData%\Microsoft\Windows Defender Advanced Threat Protection"
for %%d in (%foldersToDelete%) do (
    if defined PR (
        %PR% cmd.exe /c rmdir /s /q %%d
    ) else (
        rmdir /s /q %%d
    )
)

echo.
echo Aggressive removal complete. Please restart your computer.
goto end

:end
pause