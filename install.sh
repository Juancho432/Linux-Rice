#!/bin/bash

### Packages
sudo pacman -Syu
paru -Syu

sudo pacman -S awesome xorg-xinit git xorg xorg-server firefox kitty 7zip neovim zsh fzf \
	pkgfile bat

paru -S zsh-antidote

### Awesome
echo "exec awesome" >> ~/.xinitrc

### Fonts
mkdir -p ~/.fonts
cp Fonts/* ~.fonts
fc-cache -fv

### Kitty
mkdir -p ~/.config/kitty
cp kitty.conf ~/.config/kitty/

### ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp .zshrc ~
cp .zsh_plugins.txt ~
chsh -s "$(which zsh)" $(whoami)

