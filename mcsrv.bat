<<<<<<< HEAD
@echo OFF
echo Creating Minecraft Server File
IF NOT EXIST ./mcsrv (mkdir mcsrv && cd mcsrv) ELSE goto :run2
echo Getting Latest Java Version
curl https://ghf.synyster.org/php/ && echo .
curl -L -o server.jar https://ghf.synyster.org/php/
echo Creating Run File (default 1 GB of RAM)
echo java -Xmx1G -Xms1G -jar server.jar nogui > run.bat
server.jar
echo change FALSE to TRUE
notepad.exe eula.txt
clear
set /p answer=Would you like to Edit the Server Properties(Y/N):

if %answer% EQU Y notepad.exe server.properties
if %answer% EQU N goto :run

:run 
clear
set /p run=Would you like to start the Server?(Y/N):

if %run% EQU Y (clear && echo Starting Server && run.bat)
if %run% EQU N exit

:run2
cd mcsrv && run.bat
=======
::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::

powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install git -params '"/GitAndUnixToolsOnPath"'
git clone https://github.com/SynysterZV/mcsrv
cd mcsrv
notepad.exe server.properties
./run.bat
>>>>>>> 80b1955e6a270d769eca1f83896d82fda2d0a2f9
