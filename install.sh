#!/usr/bin/env bash
# shellcheck disable=SC2034

# Static Code

set -euo pipefail
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

VERBOSE=false
INSTALL_SHELL=false
INSTALL_AWESOME=false
UPDATE_REPOS=false

# Verbosing
function Run() {
	if [[ "$VERBOSE" == true ]]; then
		"$@"
	else
		if [[ "$1" == "sudo" ]]; then
			shift
			sudo "$@" >/dev/null 2>&1
		else
			"$@" >/dev/null 2>&1
		fi
	fi
}

function ShellInstall() {
	Run sudo pacman -S kitty 7zip neovim zsh fzf pkgfile bat
	Run paru -S zsh-antidote
	Run mkdir -p ~/.config/kitty

	if [ -f "$HOME/.config/kitty/kitty.conf" ]; then
		Run mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.preRice
	fi

	Run cp kitty.conf ~/.config/kitty/kitty.conf
	Run sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	Run cp .zshrc ~/.zshrc
	Run cp .zsh_plugins.txt ~/.zsh_plugins.txt
	Run chsh -s "$(which zsh)" "$(whoami)"
}

function AwesomeInstall() {
	Run sudo pacman -S awesome xorg xorg-xinit xorg-server
	Run echo "exec awesome" >>~/.xinitrc
}

function FontsInstall() {
	Run sudo pacman -S fontconfig
	mkdir -p ~/.fonts
	cp Fonts/* ~/.fonts
	fc-cache -fv
}

function UpdateRepos() {
	Run sudo pacman -Syu
	Run paru -Syu
}

function HelpMenu() {
	echo "Help Menu:"
	echo "	-v		Verbose Mode"
	echo "	-s		Install Shell Config"
	echo "	-a		Install AwesomeWM Config"
	echo "	-u		Update Repositories"
	echo ""
}

# Main
clear
echo ""
echo "██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗    ██████╗ ██╗ ██████╗███████╗"
echo "██║     ██║████╗  ██║██║   ██║╚██╗██╔╝    ██╔══██╗██║██╔════╝██╔════╝"
echo "██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝     ██████╔╝██║██║     █████╗  "
echo "██║     ██║██║╚██╗██║██║   ██║ ██╔██╗     ██╔══██╗██║██║     ██╔══╝  "
echo "███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗    ██║  ██║██║╚██████╗███████╗"
echo "╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝"
echo "					By Juancho432 -- Version: 1.0"
echo ""

while getopts ":vsau" opt; do
	case $opt in
		v)
			VERBOSE=true
			;;
		s)
			INSTALL_SHELL=true
			;;
		a)
			INSTALL_AWESOME=true
			;;
		u)
			UPDATE_REPOS=true
			;;
		\?)
			echo -e "${RED}Opcion Invalida: -$OPTARG${NC}"
			HelpMenu
			exit 64
			;;
	esac
done

# Check for install parameters
if [[ ! "$INSTALL_SHELL" == true && ! "$INSTALL_AWESOME" == true ]]; then
	HelpMenu
	exit 64
fi

if [[ "$UPDATE_REPOS" == true ]]; then
	UpdateRepos
fi

# Install fonts if required
if [[ "$INSTALL_AWESOME" == true || "$INSTALL_SHELL" == true ]]; then
	FontsInstall
fi