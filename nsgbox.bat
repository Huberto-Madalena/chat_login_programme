@echo off
color 0b
title Message Box
cls

:home
cls
rem checking for stop signal
::should stop signal appear, time to bail out
if exist "C:\analyst\batch\program_files\stop.msgbox" (
	del "C:\analyst\batch\program_files\stop.msgbox"
	exit
	)

echo --- Chat Messages ---
type "C:\analyst\batch\program_files\chatroom.chat"
echo.
echo (Ctrl+C to exit)
ping localhost -n 3 >nul
goto home
