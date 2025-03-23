echo warning, this tool cam make problems while installing an app, game ...
echo for security, restart your pc, and close any app that's not a part of system apps
echo then start this script again, when the script is done, you can use your pc normally

pause

@echo off

rem Check If User Has Admin Privileges
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
) else (
    echo You must run me as an Administrator. Exiting..
    echo.
    echo Right-click on me and select ^'Run as Administrator^' and try again.
    echo.
    echo Press any key to exit..
    pause > NUL
    exit
)

echo.

rem Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.* 
del /s /f /q %WinDir%\Prefetch\*.* 
del /s /f /q %Temp%\*.* 
del /s /f /q %AppData%\Temp\*.* 
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.* 

rem Delete Used Drivers Files (Not needed because already installed)
del /s /f /q %SYSTEMDRIVE%\AMD\*.* 
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.* 
del /s /f /q %SYSTEMDRIVE%\INTEL\*.* 

rem Delete Temporary Folders
rd /s /q %WinDir%\Temp 
rd /s /q %WinDir%\Prefetch 
rd /s /q %Temp% 
rd /s /q %AppData%\Temp 
rd /s /q %HomePath%\AppData\LocalLow\Temp 

rem Delete Used Drivers Folders (Not needed because already installed)
rd /s /q %SYSTEMDRIVE%\AMD 
rd /s /q %SYSTEMDRIVE%\NVIDIA 
rd /s /q %SYSTEMDRIVE%\INTEL


rem Recreate Empty Temporary Folders
md %WinDir%\Temp 
md %WinDir%\Prefetch 
md %Temp% 
md %AppData%\Temp 
md %HomePath%\AppData\LocalLow\Temp 

echo.
echo Windows Clean Up Done!, You can exit by pressing any key.
echo.

pause > NUL
exit
