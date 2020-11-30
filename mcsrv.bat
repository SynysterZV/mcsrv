@echo OFF
IF NOT EXIST ./mcsrv (mkdir mcsrv && cd mcsrv) ELSE goto :run2
echo Creating Minecraft Server File
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
echo Starting Minecraft Server...
cd mcsrv && run.bat