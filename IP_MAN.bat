@echo off
cls


echo What do you want to do?

:mainLoop
set /p choice="Choose an option (1: Change/Renew IP, 2: Delete IP, 3: Set to DHCP, 4: Set to Static): "
if "%choice%"=="1" goto changeIP
if "%choice%"=="2" goto deleteIP
if "%choice%"=="3" goto setDHCP
if "%choice%"=="4" goto setStatic
goto mainLoop

:changeIP
echo This will change or renew your IP address. Continue? (Press any key...)
pause >nul
ipconfig /renew >nul
echo Operation complete.
pause
cls
goto mainLoop

:deleteIP
echo This will release your current IP address. Continue? (Press any key...)
pause >nul
ipconfig /release >nul
echo Operation complete.
pause
cls
goto mainLoop

:setDHCP
echo This will change the IP assignment type to DHCP. Continue? (Press any key...)
pause >nul
:getIntf
set /p targetIntf="Enter target interface: "
if "%targetIntf%"=="" goto getIntf
netsh interface ip set address name="%targetIntf%" dhcp
echo Operation complete.
pause
cls
goto mainLoop

:setStatic
echo This will change the IP assignment type to static. Continue? (Press any key...)
pause >nul
set /p targetIntf="Enter target interface: "
set /p targetIP="Enter the target IP address: "
set /p subnetMask="Enter the subnet mask (e.g., 255.255.255.0): "
set /p gateway="Enter the default gateway (e.g., 192.168.1.1): "
set /p primaryDNS="Enter the primary DNS server: "
set /p secondaryDNS="Enter the secondary DNS server: "

netsh interface ip set address name="%targetIntf%" static %targetIP% %subnetMask% %gateway%
netsh interface ip set dns name="%targetIntf%" static %primaryDNS%
netsh interface ip add dns name="%targetIntf%" %secondaryDNS% index=2

echo Static IP setup complete.
pause
cls
goto mainLoop
