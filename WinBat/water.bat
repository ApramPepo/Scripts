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
echo Reminder is now running in the background
echo You can close this window
echo To disable later, re-open this file and select option [2].
schtasks /create /tn "WaterReminderTask" /tr "powershell -WindowStyle Hidden -Command [System.Windows.Forms.MessageBox]::Show('Time to drink water and stay hydrated!', 'Water Reminder', 'OK', 'Information')" /sc minute /mo 20 /f >nul 2>&1

:: feel free to adjust "mo 20" for your prefered time in minutes.

echo Task created successfully
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