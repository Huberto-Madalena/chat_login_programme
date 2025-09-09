@echo off
:home
set ch=1
color 0b
title logon screen
cls
echo 		chat logon
echo ____________________________________
echo 1. Logon
echo .
echo 2. create an account
echo.
echo 3. exit
echo ____________________________________
echo .
set /p ch=Choice Number:
if %ch%==1 goto logon
if %ch%==2 goto account
if %ch%==3 goto :eof
color 0c
echo please enter a valid number
ping localhost -n 2 >nul
goto home




:logon
color 92
cls
set /p username=Username:
echo ____________________________________
set /p pass=Password:

if not exist "C:\analyst\batch\users\%username%.unfile" goto not

rem write entered password to temp file
echo %pass% > "%tmp%\chtmp.tmp"

rem compare with stored password
fc "%tmp%\chtmp.tmp" "C:\analyst\batch\users\%username%.unfile" >nul
if errorlevel 1 goto incor

rem cleanup temp file
del "%tmp%\chtmp.tmp" >nul 2>&1

cls
goto chat






:account
cls
color 0b
set /p new_username=new username:
echo ____________________________________
set /p np=New Password:
echo %np% >"C:\analyst\batch\users\%new_username%.unfile"
cls
goto logon

:not
cls
color 0b
echo this user does not exist. please make an account for him
ping localhost -n 4 >nul
goto home


:incor
color 08
cls
echo wrong password and/or username (both are case senstive)
ping localhost -n 2 >nul
goto home

:chat
set name=%username%
echo %name% has entered the chat >> "C:\analyst\batch\program_files\chatroom.chat"
ping localhost -n 2 >nul
start "" 	"C:\analyst\batch\program_files\nsgbox.bat"

:chatloop
cls
color 0b
set /p text=text (exit to leave or kill to end the whole thing): 
if /i "%text%"=="exit" (
rem signal msgbox to close
echo stop > "C:\analyst\batch\program_files\stop.msgbox"
goto leaving
)

if /i "%text%"=="kill" (
:: signal msgbox to close
echo stop > "C:\analyst\batch\program_files\stop.msgbox"
goto kill
)

echo %username%: %text% >> "C:\analyst\batch\program_files\chatroom.chat"
goto chatloop

:leaving
	set name=%username%
echo %name% has exited the chat >> "C:\analyst\batch\program_files\chatroom.chat"

ping localhost -n 2 >nul
goto home

:kill
set name=%username%
echo %name% has decided to leave and close the application >> "C:\analyst\batch\program_files\chatroom.chat"

ping localhost -n 2 >nul
pause

exit


:chat1

set com=insertcontroller
set name=%username%
cls
color 0b
set /p text=text:
set /p com=com:
echo %name% : %text% >> C:\analyst\batch\program_files\chatroom.chat
ping localhost -n 1 >nul
goto chat1