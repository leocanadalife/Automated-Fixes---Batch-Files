::suspend output to the display
@echo off

:: set background colour blue, foreground yellow
Color 1E

::Print Welcome Message
@echo Microsoft Teams cache clearer.

::suspend output to the display
@echo off

::Run Powershell and bypass the administrative privileges
PowerShell -NoProfile Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

::Set variables
$teams = "ms-teams"
$path = "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams"

::Print Message
echo Closing Microsoft Teams...

::suspend output to the display
@echo off

::Close Teams without prompting the user if error occurs
Get-Process ms-teams |Stop-Process -Force -ErrorAction SilentlyContinue

::Print Message
@echo "Microsoft Teams has been closed successfully."
@echo "Clearing Microsoft Teams cache..."

::suspend output to the display
@echo off

::Delete the contents one by one of the Teams cache folder without prompting the user
Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue| 
    Foreach-object {
        Remove-item -Recurse -path $_.FullName 
    }

::Print Message
echo "Microsoft Teams cache has been cleared successfully."
echo "Reopening Microsoft Teams ..."

::suspend output to the display
echo off
::Start Teams
Start-Process -FilePath $teams

::Print Good bye Message
echo "All sorted! If the issue persists, please contact the Service Desk team."

:: avoiding the window to close at the end of the command and printing message on screen to get the user's input
echo "Press any key to Exit."

:: waiting for input
pause