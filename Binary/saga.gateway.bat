@echo off
rem Writen by Pein
:end
Saga.Gateway.exe
echo .
echo .
echo Gateway server crashed! restarting in 1 seconds! press ctl+C to cancel restart!
PING -n 1 127.0.0.1 >nul
goto end