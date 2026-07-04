@echo off
title Water Reminder Popup

:menu
cls
echo =========================================
echo            WATER REMINDER POPUP     
echo =========================================
echo.
echo [1] Start Reminders (Every 20 Minutes)
echo [2] Stop / Disable Reminders
echo [3] Exit
echo.
set /p userchoice="> "

if "%userchoice%" == "1" goto start_reminder
if "%userchoice%" == "2" goto stop_reminder
if "%userchoice%" == "3" exit

:start_reminder
cls
echo Setting up reminder
echo msgbox "Time to drink water and stay hydrated!", 64, "Water Reminder" > "%temp%\water_msg.vbs"
schtasks /create /tn "WaterReminderTask" /tr "wscript.exe \"%temp%\water_msg.vbs\"" /sc minute /mo 20 /f >nul 2>&1
echo Reminder is now running in the background
echo You can close this window
echo To disable later, re-open this file and select option [2].

:: feel free to adjust "mo 20" for your prefered time in minutes.
pause
goto menu

:stop_reminder
cls
schtasks /delete /tn "WaterReminderTask" /f >nul 2>&1
echo =========================================
echo  Reminder has been successfully removed.
echo =========================================
pause
goto menu

::Has been tested on both Win11 & 10. worked originally on 11 but not 10 during testing. it is now operational and should work on both
::Has been tested on Windows 11 22H2 and Windows 10 22H2.