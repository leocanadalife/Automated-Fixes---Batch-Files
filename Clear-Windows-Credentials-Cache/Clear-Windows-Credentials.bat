::suspend output to the display
@echo off

::Print Message
@echo Clearing Windows Credentials cache.
@echo:

::suspend output to the display
@echo off

::Delete the Windows Credentials cache
FOR /F "tokens=1,2 delims= " %%G IN ('cmdkey /list ^| findstr Target') DO cmdkey /delete %%H

::Print Message
@echo Windows Credentials cache has been cleared successfully.
@echo:

::avoiding the window to close at the end of the command and wait for input
pause