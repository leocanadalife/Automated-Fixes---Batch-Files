#Run Powershell and bypass the administrative privileges
#-ExecutionPolicy Bypass | Out-Null

#Set variables
$teams = "ms-teams"
$path = "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams"

#Print Message
Write-Host Closing Microsoft Teams...

#Close Teams without prompting the user if error occurs
Get-Process ms-teams |Stop-Process -Force -ErrorAction SilentlyContinue | Out-Null

#Print Message
Write-Host "Microsoft Teams has been closed successfully."
Write-Host "Clearing Microsoft Teams cache..."

#Delete the contents one by one of the Teams cache folder without prompting the user
Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue| 
    Foreach-object {
        Remove-item -Recurse -path $_.FullName 
    }
| Out-Null
#Print Message
Write-Host "Microsoft Teams cache has been cleared successfully."
Write-Output "Reopening Microsoft Teams ..."

#Start Teams
Start-Process -FilePath $teams | Out-Null

#Print Good bye Message
Write-Host "Done! If the issue persists, please contact the Service Desk team."

# avoiding the window to close at the end of the command and printing message on screen to get the user input
Write-Host -NoNewLine "Press any key to Exit...";
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
