# Packages

In this section, we'll list the different packages, drivers and configuration specific items that this project deploys on EC2 instances. All those items are customizable through the Ansible role. We list the packages for Linux and Windows separately, as they both have different packages available.

## 🐧 Linux

### Core Packages

> Those are packages which aim to be bundled into the image as they are typically required to build the image.

Name                 | Description | License
-------------------- | ----------- | -------
[gnupg2](https://gnupg.org/)    | GNU GPG tools required to add APT or RPM repository keys. | GNU General Public License
[snapd](https://snapcraft.io/)  | The Snap package manager required to install some packages. | GNU GPLv3
[flatpak](https://flatpak.org/) | The Flatpak package manager managing most installed packages. | LGPL
[rsync](https://fr.wikipedia.org/wiki/Rsync) | Required by Ansible to synchronize local directory with remote directories. | GPL 3
[git](https://git-scm.com/) | The Git source control management client. | GNU General Public License version 2.0
[curl](https://curl.se/) | HTTP(S) command-line tool - *Required by Ansible to perform HTTPS queries.* | MIT License
[wget](https://www.gnu.org/software/wget/) | HTTP(S) and FTP(S) command-line tool. | GPL 3.0
[zip](https://www.geeksforgeeks.org/zip-command-in-linux-with-examples/) | File compression utility. | MIT License
[dkms](https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support) | Compile kernel modules - Required for NVIDIA drivers. | GPL 2.0
[python3-pip](https://docs.python.org/3/installing/index.html) | Pip for Python 3 required by Ansible to install some packages. | MIT

### Native Packages

> Those are packages installed using the operating-system native package manager.

Name                      | Description | License
------------------------- | ----------- | -------
[mosh](https://mosh.org/) | Remote terminal application that allows roaming, supports intermittent connectivity, and provides intelligent local echo and line editing of user keystrokes. | GPL 3.0
[tmux](https://github.com/tmux/tmux/wiki) | tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal. | ISC
[socat](https://linux.die.net/man/1/socat) | Socat is a command line based utility that establishes two bidirectional byte streams and transfers data between them. | GNU General Public License v3.0
[build-essential](https://linuxhint.com/install-build-essential-ubuntu/) | The build-essentials packages are meta-packages that are necessary for compiling software. They include the GNU debugger, g++/GNU compiler collection, and some more tools and libraries that are required to compile a program. | Meta-package, see each package's license separately.
[vim](https://www.vim.org/) | Vim is a highly configurable text editor built to make creating and changing any kind of text very efficient. It is included as "vi" with most UNIX systems and with Apple OS X. | Vim License
[openjdk-11-jdk](https://openjdk.org/projects/jdk/11/) | JDK 11 is the open-source reference implementation of version 11 of the Java SE Platform as specified by by JSR 384 in the Java Community Process. | GNU General Public License v2.0
[jq](https://stedolan.github.io/jq/) | jq is a lightweight and flexible command-line JSON processor. | MIT License
[exa](https://github.com/ogham/exa) | exa is a modern replacement for ls. | MIT License
[fzf](https://github.com/junegunn/fzf) | fzf is a general-purpose command-line fuzzy finder. | MIT License
[gh](https://cli.github.com/) | GitHub CLI brings GitHub to your terminal. Free and open source. | MIT License
[neofetch](https://github.com/dylanaraps/neofetch) | A command-line system information tool written in bash 3.2+. | MIT License
[ffmpeg](https://ffmpeg.org/) | A complete, cross-platform solution to record, convert and stream audio and video. | Most files in FFmpeg are under the GNU Lesser General Public License version 2.1 or later (LGPL v2.1+). Some optional parts of FFmpeg are licensed under the GNU General Public License version 2 or later (GPL v2+).
[mplayer](https://en.wikipedia.org/wiki/MPlayer) | MPlayer is a free and open-source media player software application. It is available for Linux, OS X and Microsoft Windows. | MIT License
[gparted](https://gparted.org/) | GParted is a free partition editor for graphically managing your disk partitions. | GPL 2.0
[tailscale](https://tailscale.com/) | Tailscale connects your team's devices and development environments for easy access to remote resources. | BSD 3-Clause "New" or "Revised" License
[httpie](https://httpie.io/) | HTTPie is making APIs simple and intuitive for those building the tools of our time. | BSD-3-Clause
[bat](https://github.com/sharkdp/bat) | A cat(1) clone with syntax highlighting and Git integration. | bat is made available under the terms of either the MIT License or the Apache License 2.0, at your option.

### Flatpaks

> Those are applications that run in a sandbox on the operating-system and are installed by Flatpak.

Name | Package Name | Description | License
---- | ------------ | ----------- | -------
[Google Chrome](https://flathub.org/apps/details/com.google.Chrome) | `com.google.Chrome` | Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier. | Commercial
[Firefox](https://flathub.org/apps/details/org.mozilla.firefox) | `org.mozilla.firefox` | Fast, Private & Safe Web Browser. | Mozilla Public License
[Discord](https://flathub.org/apps/details/com.discordapp.Discord) | `com.discordapp.Discord` | Discord is a free all in one messaging, voice, and video client thats available on your computer and phone. | Commercial, see the [Licenses](https://discord.com/licenses) page.
[Spotify](https://flathub.org/apps/details/com.spotify.Client) | `com.spotify.Client` | Online music streaming service. | Commercial
[VLC](https://flathub.org/apps/details/org.videolan.VLC) | `org.videolan.VLC` | VLC media player, the open-source multimedia player. | GPL-2.0-or-later
[Brave Browser](https://flathub.org/apps/details/com.brave.Browser) | `com.brave.Browser` | The web browser from Brave. | Mozilla Public License 2.0
[WhatsApp Desktop](https://flathub.org/apps/details/io.github.mimbrero.WhatsAppDesktop) | `io.github.mimbrero.WhatsAppDesktop` | Unofficial WhatsApp Web Desktop client. | Commercial
[Microsoft Teams](https://flathub.org/apps/details/com.github.IsmaelMartinez.teams_for_linux) | `com.github.IsmaelMartinez.teams_for_linux` | Unofficial Microsoft Teams client for Linux using Electron. | Commercial
[Postman](https://flathub.org/apps/details/com.getpostman.Postman) | `com.getpostman.Postman` | Postman is a complete API development environment. | Proprietary (with open source components)
[IntelliJ IDEA Ultimate](https://flathub.org/apps/details/com.jetbrains.IntelliJ-IDEA-Ultimate) | `com.jetbrains.IntelliJ-IDEA-Ultimate` | Capable and Ergonomic Java IDE for Enterprise, Web and Mobile Development. | Commercial
[GHex](https://flathub.org/apps/details/org.gnome.GHex) | `org.gnome.GHex` | Inspect and edit binary files. | GPLv2+
[Slack](https://flathub.org/apps/details/com.slack.Slack) | `com.slack.Slack` | Chat with your team. | Commercial
[Authy](https://flathub.org/apps/details/com.authy.Authy) | `com.authy.Authy` | Twilio Authy two factor authentication desktop application. | Commercial
[Draw.io](https://flathub.org/apps/details/com.jgraph.drawio.desktop) | `com.jgraph.drawio.desktop` | Create and share diagrams. | Apache License 2.0
[DataGrip](https://flathub.org/apps/details/com.jetbrains.DataGrip) | `com.jetbrains.DataGrip` | IntelliJ-based IDE for databases and SQL. | Commercial
[Emacs](https://flathub.org/apps/details/org.gnu.emacs) | `org.gnu.emacs` | An extensible text editor. | GPL-3.0-or-later

### Snaps

> Those are packages provided by the [Snapstore](https://snapcraft.io/store) and installed as Snaps.

Name                | Description | License
------------------- | ----------- | -------
[scrcpy](https://snapcraft.io/scrcpy) | This application provides display and control of Android devices connected on USB (or over TCP/IP). It does not require any root access. | Apache License 2.0
[code](https://snapcraft.io/code) | Visual Studio Code is a new choice of tool that combines the simplicity of a code editor with what developers need for the core edit-build-debug cycle. | MIT License
[terraform](https://snapcraft.io/terraform) | Terraform enables you to safely and predictably create, change, and improve infrastructure. | Mozilla Public License 2.0
[kubectl](https://snapcraft.io/kubectl) | kubectl is a command line client for running commands against Kubernetes clusters. | Apache-2.0
[notion-snap-reborn](https://snapcraft.io/notion-snap-reborn) | One workspace for team collaboration, personal milestones, and everything in between. | Commercial
[nmap](https://snapcraft.io/nmap) | Nmap is a utility for network exploration or security auditing. | GPL-2.0

### Other Packages

Name                      | Description | License
------------------------- | ----------- | -------
[Docker + Docker Compose](../tasks/docker/) | Docker Installation for the main user + Docker Compose | [Documentation](https://www.docker.com/pricing/faq/)
[AWS CLI](../tasks/aws/awscli) | AWS CLI v2 installed for the main user. | Apache License, Version 2.0
[AWS SSM Agent](../tasks/aws/ssm-agent/) | AWS SSM Agent installed and started as a service. | Apache License 2.0
[AWS EFS Utils](https://github.com/aws/efs-utils) | Utilities for Amazon Elastic File System (EFS) | MIT License
[Copilot CLI](https://aws.github.io/copilot-cli/) | AWS Copilot is an open source command line interface that makes it easy for developers to build, release, and operate production ready containerized applications on AWS App Runner, Amazon ECS, and AWS Fargate. | Apache License 2.0
[NVIDIA Drivers](../tasks/nvidia/) | NVIDIA Drivers installed for each platform if an NVIDIA GPU is detected. | Commercial
[Kitty + ZSH + Oh-My-ZSH](../tasks/terminal/) | Modern terminal with ZSH as the default shell and Oh-My-ZSH as the default theme for ZSH. | Kitty is under GNU General Public License v3.0, ZSH is under MIT-Modern-Variant and Oh-My-ZSH is under MIT.
[NodeJS](../tasks/nodejs/) | NodeJS managed by NVM. | [License](https://github.com/nodejs/node/blob/main/LICENSE)
[NiceDCV](../tasks/nicedcv/) | NiceDCV is the low-latency pixel streaming protocol used to interact with the graphical interface of the instance. | Commercial
[Desktop Manager](../tasks/desktop-manager/) | Installation and configuration of the instance desktop manager. | GNOME on Linux is published under GPLv2.
[Firewall](../tasks/firewall/) | Installation and configuration of the firewall on Linux and Windows. | ufw is published under GNU General Public License, firewalld is published under GNU General Public License v2.0.

## 🪟 Windows

### Chocolatey Packages

Name            |         Description        | License
--------------- | -------------------------- | -------
googlechrome    | Google Chrome Browser      | Commercial
firefox         | Firefox Browser by Mozilla | Mozilla Public License
python3         | The Python3 interpreter    | [License](https://docs.python.org/3/license.html)
nodejs          | NodeJS interpreter         | [License](https://github.com/nodejs/node/blob/main/LICENSE)
javaruntime     | Java Runtime 8             | [License](https://www.oracle.com/downloads/licenses/binary-code-license.html)
slack           | Chat with your team.       | Commercial
vscode          | Visual Studio Code         | Commercial
androidstudio   | Android Studio             | [Terms and Conditions](https://developer.android.com/studio/terms)
docker-desktop  | Docker Desktop for Windows | [License](https://www.docker.com/pricing/faq/)
git             | The Git source control management client. | GNU General Public License version 2.0
alacritty       | A fast, cross-platform, OpenGL terminal emulator | Apache License, Version 2.0
awscli          | AWS CLI v2 installed for the main user. | Apache License, Version 2.0
jq              | jq is a lightweight and flexible command-line JSON processor. | MIT License
terraform       | Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. | Mozilla Public License 2.0
github-desktop  | GitHub Desktop is an open source Electron-based GitHub app. It is written in TypeScript and uses React. | MIT License
postman         | Postman is a complete API development environment. | Proprietary (with open source components)
wireshark       | Wireshark is a network traffic analyzer, or "sniffer", for Linux, macOS, *BSD and other Unix and Unix-like operating systems and for Windows. | GNU General Public License v2.0
putty           | PuTTY is a free and open-source terminal emulator, serial console and network file transfer application. | MIT License
curl            | HTTP(S) command-line tool | MIT License
tailscale       | Tailscale connects your team's devices and development environments for easy access to remote resources. | BSD 3-Clause "New" or "Revised" License
notion          | Notion is a freemium productivity and note-taking web application developed by Notion Labs Inc. | Commercial
oh-my-posh      | A blazing fast cross platform/shell prompt renderer | MIT License
winscp          | WinSCP is a popular free SFTP and FTP client for Windows, a powerful file manager that will improve your productivity. | GNU General Public License
7zip            | 7-Zip is a file archiver with a high compression ratio. | [License](https://7-zip.org/license.txt)
spotify         | Online music streaming service. | Commercial
ffmpeg          | A complete, cross-platform solution to record, convert and stream audio and video. | Most files in FFmpeg are under the GNU Lesser General Public License version 2.1 or later (LGPL v2.1+). Some optional parts of FFmpeg are licensed under the GNU General Public License version 2 or later (GPL v2+).
vlc             | VLC media player, the open-source multimedia player. | GPL-2.0-or-later
powertoys       | Windows PowerToys | Commercial
authy-desktop   | Twilio Authy two factor authentication desktop application. | Commercial
microsoft-windows-terminal | Microsoft Windows Terminal | MIT License

## 📦 Common Packages

### Python Packages

Name     | Description | License
-------- | ----------- | -------
[psutil](https://pypi.org/project/psutil/) | psutil (process and system utilities) is a cross-platform library for retrieving information on running processes and system utilization (CPU, memory, disks, network, sensors) in Python. | BSD 3-Clause "New" or "Revised" License
[sshuttle](https://pypi.org/project/sshuttle/) | Transparent proxy server that works as a poor man's VPN. | GNU Lesser General Public License v2.1
[pgcli](https://pypi.org/project/pgcli/) | Postgres CLI with autocompletion and syntax highlighting | BSD 3-Clause "New" or "Revised" License
[thefuck](https://pypi.org/project/thefuck/) | Magnificent app which corrects your previous console command. | MIT License

### NPM Packages

Name        | Description | License
----------- | ----------- | -------
[tldr](https://github.com/tldr-pages/tldr) | Collaborative cheatsheets for console commands | Creative Commons Attribution 4.0 International License
[how2](https://github.com/santinic/how2) | AI for the Command Line | MIT License
[fkill-cli](https://github.com/sindresorhus/fkill-cli) | Fabulously kill processes. | MIT License
[typescript](https://github.com/microsoft/TypeScript) | TypeScript is a superset of JavaScript that compiles to clean JavaScript output. | Apache License 2.0
[aws-cdk](https://github.com/aws/aws-cdk) | The AWS Cloud Development Kit is a framework for defining cloud infrastructure in code. | Apache License 2.0
[ngrok](https://github.com/inconshreveable/ngrok) | Introspected tunnels to localhost. | Apache License 2.0
