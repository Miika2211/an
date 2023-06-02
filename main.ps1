net.exe start Audiosrv
net.exe user $env:UserName "Miika2211"
write-host Username: $env:UserName
write-host Password: Miika2211
Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
Expand-Archive ngrok.zip
.\ngrok\ngrok.exe authtoken 2QMrohHGsj934ift1g4cV03xb0A_7gHVj4e5UbaUXgfq1vdZn
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
Start-Process Powershell -ArgumentList '-Noexit -Command ".\ngrok\ngrok.exe tcp 3389"'
sleep 320
yes
