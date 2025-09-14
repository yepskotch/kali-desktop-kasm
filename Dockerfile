FROM kasmweb/kali-rolling-desktop:1.17.0-rolling-weekly
USER root

ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

### Install sudo and grant kasm-user sudo privileges
RUN apt-get update \
    && apt-get install -y sudo \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

### Install software
RUN apt update && apt install -y \
	ffuf \
	dirb \
	seclists \
	gobuster \
	hashcat \
	golang \
	exploitdb \
	ssh \
	freerdp3-x11 \
	openvpn \
	zsh-autosuggestions \
	pipx \
	powershell \
	evil-winrm \
	dnsrecon \
	feroxbuster \
	onesixtyone \
	oscanner \
	sipvicious \
	smbmap \
	tnscmd10g \
	dnsutils \
	code-oss \
	iputils-ping \
	dnsenum \
	ftp \
	sqsh \
	eyewitness \
	php \
	socat \
	tmux \
	proxychains \
	sshuttle

## Cleaning
RUN apt-get autoremove -y && apt-get autoclean -y

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME
RUN chsh -s /bin/zsh kasm-user

USER 1000