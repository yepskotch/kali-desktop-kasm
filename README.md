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
```

The image rebuilds weekly after the Kasm Web weekly rolling image has been released.

Image can be pulled from `skotch/kali-desktop-kasm:latest`.

To allow openvpn to work, add the following to your Docker Run Config Override:

```json
{
  "environment": {
    "SHELL": "/bin/zsh"
  },
  "devices": [
    "dev/net/tun",
    "/dev/net/tun"
  ],
  "privileged": true
}
```

To change the default shell to zsh, add the following to your Docker Exec Config:

```json
{
  "first_launch": {
    "user": "root",
    "cmd": "bash -c 'chsh -s /bin/zsh kasm-user'"
  }
}
```

Full write-up coming soon(tm).