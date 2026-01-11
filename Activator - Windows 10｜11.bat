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

mode con cols=100 lines=40 & color fc

rem Admin Perms
:: BatchGotAdmin  
:-------------------------------------  
rem  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo is in the administrator privileges. If you want to use the UAC window, please select Allow...
    goto UACPrompt  
) else ( goto gotAdmin )   
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"   
    "%temp%\getadmin.vbs"
    exit /B  
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%"  
    CD /D "%~dp0"

rem Activation Part
cls
:start
echo\
echo              Please enter the number to select (please execute in_administrator mode):
echo
echo           ==============================================================================
echo           *                                                                            *
echo           *                    1: Activate Windows10 - 11 Professional                 *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *               2: Activate Windows10 - 11 Workstation Professional          *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *               3: Activate Windows10 - 11 Professional Education            *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        4: Activate Windows10 - 11 Education                *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        5: Activate Windows10 - 11 Entreprise               *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                          6: Check Windows Activation                       *
echo           *                                                                            *
echo           ==============================================================================
set /P var=":"
if %var%==1 goto 1
if %var%==2 goto 2
if %var%==3 goto 3
if %var%==4 goto 4
if %var%==5 goto 5
if %var%==6 goto look

:1
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *   Next, it will start automatically, and a window will pop up three times. *
echo           *   Please click OK on each pop-up window.                                   *
echo           *   The startup process requires an Internet connection.                     *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         Step 1 Installing the Product Key...
echo\
slmgr -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
echo\
echo                                         Step 2 set up KMS...
echo\
slmgr -skms kms.loli.best 
echo\
echo                                         Step 3 Automatic Internet Activations...
echo\
slmgr -ato
goto exit


:2
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *   Next, it will start automatically, and a window will pop up three times. *
echo           *   Please click OK on each pop-up window.                                   *
echo           *   The startup process requires an Internet connection.                     *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         Step 1 Installing the Product Key...
echo\
slmgr -ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
echo\
echo                                         Step 2 set up KMS...
echo\
slmgr -skms kms.loli.best 
echo\
echo                                         Step 3 Automatic Internet Activations...
echo\
slmgr -ato
goto exit


:3
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *   Next, it will start automatically, and a window will pop up three times. *
echo           *   Please click OK on each pop-up window.                                   *
echo           *   The startup process requires an Internet connection.                     *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         Step 1 Installing the Product Key...
echo\
slmgr -ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
echo\
echo                                         Step 2 set up KMS...
echo\
slmgr -skms kms.loli.best 
echo\
echo                                         Step 3 Automatic Internet Activations...
echo\
slmgr -ato
goto exit

:4
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *   Next, it will start automatically, and a window will pop up three times. *
echo           *   Please click OK on each pop-up window.                                   *
echo           *   The startup process requires an Internet connection.                     *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         Step 1 Installing the Product Key....
echo\
slmgr -ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
echo\
echo                                         Step 2 set up KMS...
echo\
slmgr -skms kms.loli.best 
echo\
echo                                         Step 3 Automatic Internet Activations...
echo\
slmgr -ato
goto exit


:5
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *   Next, it will start automatically, and a window will pop up three times. *
echo           *   Please click OK on each pop-up window.                                   *
echo           *   The startup process requires an Internet connection.                     *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         Step 1 Installing the Product Key....
echo\
slmgr -ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
echo\
echo                                         Step 2 set up KMS...
echo\
slmgr -skms kms.loli.best 
echo\
echo                                         Step 3 Automatic Internet Activations...
echo\
slmgr -ato
goto exit



:look
cls
echo\
echo             Please pay attention to the contents of the pop-up window
slmgr.vbs -dlv
goto exit


:exit
echo\
echo\
echo\
echo\
echo\
echo\
echo           *******************************Command completed******************************
echo           *                                                                            *
echo           *                             Press any X to exit                            *
echo           *             Source: https://github.com/kwokaa2019/Micrsoft-KMS-bat         *
echo           *                                                                            *
echo           ******************************************************************************
pause>nul 
start  exit
