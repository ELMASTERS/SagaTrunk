@echo off
rem This is and auto-restart script for the Saga Ragnarok Online 2 Server Emulator.
rem It will also keep the world server OPEN after it crashes to that errors may be
rem more easily identified
rem Writen by Pein
start cmd /k Saga.Map.bat
start cmd /k Saga.Gateway.bat
start cmd /k Saga.Authentication.bat
