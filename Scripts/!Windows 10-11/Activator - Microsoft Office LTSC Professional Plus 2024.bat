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

title Activate Microsoft Office LTSC Professional Plus 2024 !
cls
echo ============================================================================
echo #Project: Activating Microsoft software products
echo ============================================================================
echo.
echo #Supported products:
echo - Microsoft Office LTSC Professional Plus 2024
echo.
echo.
(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")
(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")
(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2024VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2024VL_MAK*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
echo.
echo ============================================================================
echo Activating your Office...
cscript //nologo slmgr.vbs /ckms >nul
cscript //nologo ospp.vbs /setprt:1688 >nul
cscript //nologo ospp.vbs /unpkey:6MWKP >nul
cscript //nologo ospp.vbs /inpkey:XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB >nul
set i=1
:server
if %i%==1 set KMS_Sev=kms.loli.best
if %i%==2 set KMS_Sev=kms.loli.beer
if %i%==3 set KMS_Sev=kms.03k.org
if %i%==4 goto notsupported
cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul
echo ============================================================================
echo.
echo.
cscript //nologo ospp.vbs /act | find /i "successful" 

 (echo.
echo ============================================================================
echo #Please feel free to contact me at admin@gmail.com if you have any questions or concerns.
echo ============================================================================
choice /n /c YN /m "Would you like to visit my Page [Y,N]?" 
 if errorlevel 2 exit) || (echo The connection to my KMS server failed! Trying to connect to another one... 
 echo Please wait... 
 echo. 
 echo. 
 set /a i+=1 
 goto server)
explorer "https://github.com/kwokaa2019"
goto halt
:notsupported
echo.
echo ============================================================================
echo Sorry! Your version is not supported.
echo.
:halt
pause >nul
