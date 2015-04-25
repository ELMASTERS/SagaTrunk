@echo off
rem Writen by Pein
:end
Saga.Map.exe
echo .
echo .
echo Map server crashed! restarting in 15 seconds! press ctl+C to cancel restart!
PING -n 3 127.0.0.1 >nul
goto end