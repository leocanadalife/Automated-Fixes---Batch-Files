::suspend output to the display
@echo off

:: set background colour blue, foreground yellow
Color 1E

::Print Welcome Message
@echo Microsoft Teams cache clearer.

::suspend output to the display
@echo off

::Print Message
echo Closing Microsoft Teams...

::suspend output to the display
@echo off

::Close Teams
taskkill /im ms-teams.exe /t /f

::Print Message
@echo Microsoft Teams has been closed successfully.
@echo Clearing Microsoft Teams cache...

::suspend output to the display
echo off

::Delete the contents of the Teams cache folder without prompting the user
@RD /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Teams"

::Print Message
echo Microsoft Teams cache has been cleared successfully.
echo Reopening Microsoft Teams ...

::suspend output to the display
echo off
::Start Teams
start ms-teams

::Print Good bye Message
echo All done! If the issue persists, please contact the Service Desk team.

:: avoiding the window to close at the end of the command and printing message on screen to get the user's input
echo Press any key to Exit.

:: waiting for input
pause