::suspend output to the display
@echo off
echo.
echo Recreating Outlook Mail Profile...
echo.

:: Close Outlook
taskkill /IM outlook.exe /F


reg delete "HKCU\Software\Microsoft\Office\16.0\Outlook\Profiles\Outlook" /f 

:: Add the Outlook profile registry key
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Profiles\Outlook"

rmdir /S %localappdata%\Microsoft\Outlook

:: Start Outlook
start outlook

echo Outlook Mail Profile has been recreated.
echo.
pause