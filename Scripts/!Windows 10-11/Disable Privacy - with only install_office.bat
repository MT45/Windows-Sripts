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

:: ----------------------------------------Disable Privacy Settings----------------------------------------
:: General
echo "Disabling General Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f

:: Speech, Inking & Typing
echo "Disabling Speech, Inking & Typing Privacy Settings"
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f

:: Account Info
echo "Disabling Account Info Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v Value /t REG_SZ /d "Deny" /f

:: Contacts
echo "Disabling Contacts Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v Value /t REG_SZ /d "Deny" /f

:: Calendar 
echo "Disabling Calendar Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v Value /t REG_SZ /d "Deny" /f

:: Call History
echo "Disabling Call History Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v Value /t REG_SZ /d "Deny" /f

:: Email
echo "Disabling Email Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v Value /t REG_SZ /d "Deny" /f

:: Tasks
echo "Disabling Tasks Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v Value /t REG_SZ /d "Deny" /f

:: Messaging
echo "Disabling Messaging Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v Value /t REG_SZ /d "Deny" /f

:: Radios
echo "Disabling Radios Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v Value /t REG_SZ /d "Deny" /f

:: Other Devices
echo "Disabling Other Devices Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v Value /t REG_SZ /d "Deny" /f

:: Diagnostic Information
echo "Disabling Diagnostic Information Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: App Diagnostics
echo "Disabling App Diagnostics Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v Value /t REG_SZ /d "Deny" /f

:: Documents
echo "Disabling Documents Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v Value /t REG_SZ /d "Deny" /f

:: Pictures
echo "Disabling Pictures Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v Value /t REG_SZ /d "Deny" /f

:: Videos
echo "Disabling Videos Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v Value /t REG_SZ /d "Deny" /f

:: File System
echo "Disabling File System Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v Value /t REG_SZ /d "Deny" /f

:: General Privacy Settings
echo "Disabling General Privacy Settings"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v AdvertisingId /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v SmartScreenEnabled /t REG_DWORD /d 0 /f

:: Speech, Inking & Typing
echo "Disabling Speech, Inking & Typing Privacy Settings"
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f

:: Diagnostics & Feedback
echo "Disabling Diagnostics & Feedback Privacy Settings"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v DiagnosticDataSettings /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v AllowExperimentation /t REG_DWORD /d 0 /f

:: Activity History
echo "Disabling Activity History Privacy Settings"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ActivityDataLayer" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ActivityDataLayer" /v PublishUserActivities /t REG_DWORD /d 0 /f

:: App Permissions
echo "Disabling App Permissions Privacy Settings"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v Value /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v SystemSettingsDownloadMode /t REG_DWORD /d 0 /f

:: Voice Activation
echo "Disabling Voice Activation Privacy Settings"
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation" /v Value /t REG_SZ /d "Deny" /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationEnabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationLastUsed /t REG_DWORD /d 0 /f

:: Additional voice activation settings
reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationEnabled /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationLastUsed /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsActivateWithVoice /t REG_DWORD /d 2 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsActivateWithVoiceAboveLock /t REG_DWORD /d 2 /f

:: Enables NumLock on Startup
reg.exe add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f

:: Disable Fast Startup
echo "Disabling Fast Startup"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

:: --------------------------------------------------------------------------------------------------------------------------------------------------------

:: Create Office directory and download deployment tool
echo "Creating Office directory and downloading deployment tool"
mkdir C:\Office
curl -L "https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_19628-20046.exe" -o "C:\Office\officedeploymenttool.exe"
cd /d C:\Office

:: Extract deployment tool
echo "Extracting deployment tool"
C:\Office\officedeploymenttool.exe /extract:C:\Office

:: Create Configuration2024.xml file
echo ^<Configuration ID="ccad5fff-31a5-46e3-981c-b8070ebbf76d"^> > "C:\Office\Configuration2024.xml"
echo   ^<Add OfficeClientEdition="64" Channel="PerpetualVL2024"^> >> "C:\Office\Configuration2024.xml"
echo     ^<Product ID="ProPlus2024Volume" PIDKEY="XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB"^> >> "C:\Office\Configuration2024.xml"
echo       ^<Language ID="en-us" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="Lync" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="OneDrive" /^> >> "C:\Office\Configuration2024.xml"
echo     ^</Product^> >> "C:\Office\Configuration2024.xml"
echo     ^<Product ID="VisioPro2024Volume" PIDKEY="B7TN8-FJ8V3-7QYCP-HQPMV-YY89G"^> >> "C:\Office\Configuration2024.xml"
echo       ^<Language ID="en-us" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="Lync" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="OneDrive" /^> >> "C:\Office\Configuration2024.xml"
echo     ^</Product^> >> "C:\Office\Configuration2024.xml"
echo     ^<Product ID="ProjectPro2024Volume" PIDKEY="FQQ23-N4YCY-73HQ3-FM9WC-76HF4"^> >> "C:\Office\Configuration2024.xml"
echo       ^<Language ID="en-us" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="Lync" /^> >> "C:\Office\Configuration2024.xml"
echo       ^<ExcludeApp ID="OneDrive" /^> >> "C:\Office\Configuration2024.xml"
echo     ^</Product^> >> "C:\Office\Configuration2024.xml"
echo   ^</Add^> >> "C:\Office\Configuration2024.xml"
echo   ^<Property Name="SharedComputerLicensing" Value="0" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<Property Name="FORCEAPPSHUTDOWN" Value="FALSE" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<Property Name="DeviceBasedLicensing" Value="0" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<Property Name="SCLCacheOverride" Value="0" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<Property Name="AUTOACTIVATE" Value="1" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<Updates Enabled="TRUE" /^> >> "C:\Office\Configuration2024.xml"
echo   ^<AppSettings^> >> "C:\Office\Configuration2024.xml"
echo     ^<User Key="software\microsoft\office\16.0\excel\options" Name="defaultformat" Value="51" Type="REG_DWORD" App="excel16" Id="L_SaveExcelfilesas" /^> >> "C:\Office\Configuration2024.xml"
echo     ^<User Key="software\microsoft\office\16.0\powerpoint\options" Name="defaultformat" Value="27" Type="REG_DWORD" App="ppt16" Id="L_SavePowerPointfilesas" /^> >> "C:\Office\Configuration2024.xml"
echo     ^<User Key="software\microsoft\office\16.0\word\options" Name="defaultformat" Value="" Type="REG_SZ" App="word16" Id="L_SaveWordfilesas" /^> >> "C:\Office\Configuration2024.xml"
echo   ^</AppSettings^> >> "C:\Office\Configuration2024.xml"
echo ^</Configuration^> >> "C:\Office\Configuration2024.xml"

:: Download and configure Office
echo "Downloading and configuring Office"
C:\Office\setup.exe /download Configuration2024.xml
C:\Office\setup.exe /configure Configuration2024.xml

pause