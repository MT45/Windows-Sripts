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

:: ----------------------------------------Removes edge BY MT----------------------------------------

echo "Removes edge updates folder"
taskkill /F /IM msedge.exe
taskkill /F /IM MicrosoftEdgeUpdate.exe
sc stop edgeupdate
sc stop edgeupdatem
rmdir /S /Q "C:\Program Files (x86)\Microsoft"
rmdir /S /Q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rmdir /S /Q "C:\Program Files (x86)\Microsoft\EdgeCore"
rmdir /S /Q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rmdir /S /Q "C:\ProgramData\Microsoft\EdgeUpdate"
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
pause