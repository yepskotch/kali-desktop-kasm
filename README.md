# kali-desktop-kasm


Based on `kasmweb/kali-rolling-desktop:1.17.0-rolling-weekly`.

Custom Kali Desktop image for [Kasm Web](https://kasmweb.com/) that installs the following additional packages:

```
ffuf
dirb
seclists
gobuster
hashcat
golang
exploitdb
ssh
freerdp3-x11
openvpn
zsh-autosuggestions
pipx
powershell
evil-winrm
dnsrecon
feroxbuster
onesixtyone
oscanner
sipvicious
smbmap
tnscmd10g
dnsutils
code-oss
iputils-ping
dnsenum
ftp
sqsh
eyewitness
php
socat
tmux
proxychains
sshuttle
faketime
```

The image rebuilds weekly after the Kasm Web weekly rolling image has been released.

Image can be pulled from `skotch/kali-desktop-kasm:latest`.

Edit your `Docker Run Config Override` to allow openvpn to work:

```json
{
  "devices": [
    "dev/net/tun",
    "/dev/net/tun"
  ],
  "privileged": true
}
```

Full write-up coming soon(tm).