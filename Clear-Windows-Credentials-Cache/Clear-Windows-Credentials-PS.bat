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

::Load the necessary functions
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Advapi32 {
    [DllImport("advapi32.dll", SetLastError = true, CharSet=CharSet.Unicode)]
    public static extern bool CredDelete(string target, int type, int flags);
}
"@

::Define the credential type (generic credentials)
$credType = 1

::Get all generic credentials
$credentials = cmdkey /list | Where-Object { $_ -like "*Target:*" }

foreach ($credential in $credentials) {
    $target = ($credential -split ": ")[1]
    [Advapi32]::CredDelete($target, $credType, 0)
}

::Print goodbye message
Write-Output "All credentials have been cleared from the Windows Credential Manager."