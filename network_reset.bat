echo off
cls
ipconfig /flushdns
ipconfig /release
ipconfig /renew
ipconfig /registerdns
arp -d *
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset
netsh interface set interface "Ethernet" disable
timeout /t 2
netsh interface set interface "Ethernet" enable
echo Network reset complete. Press ENTER to exit.
pause > null
