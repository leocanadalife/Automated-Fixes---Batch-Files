08Powershell.exe -executionpolicy remotesigned -File  C:\Users\SE\Desktop\ps.ps1

::suspend output to the display
@echo off

:: set background colour blue, foreground yellow
Color 9F

::Set beggining of batch file
:start

:: printing message on screen to get the user's input
@echo off
set /p "id=Enter ID: "

:: command to get the user's information
Net user %id% /domain

get-aduser -identity %id% -properties * | select DisplayName, Company, Department, Created, mail, mailNickname, lastlogondate, lockedout, accountlockouttime, passwordexpired, passwordlastset, PasswordNeverExpires, accountexpirationdate, badlogoncount, lastbadpasswordattempt| format-list

:: avoiding the window to close at the end of the command and printing message on screen to get the user's input
@echo Press any key to Exit.

:: waiting for input
pause

::Loop
goto start