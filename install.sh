#!/bin/bash

### Packages
sudo pacman -Syu
paru -Syu
sudo pacman -S awesome xorg-xinit git xorg xorg-server firefox kitty 7zip neovim zsh fzf \
	pkgfile bat
paru -S zsh-antidote

### startx
echo "exec awesome" >> ~/.xinitrc

### Fonts
mkdir -p ~/.fonts
cp Fonts/* ~.fonts

### Kitty
mkdir -p ~/.config/kitty
cp kitty.conf ~/.config/kitty/

### ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc
cp .zsh_plugins.txt ~/.zsh_plugins.txt
