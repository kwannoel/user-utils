#!/usr/bin/env bash

# Sync local with remote repo
echo "This shell script installs user files to your home directory\n"
read -p "Proceed? (y/n) " yn
if [ "$yn" != 'y' ]
then
    return;
fi

read -p "Enter your device name (zenbook/thinkpad): " device

#  nixos setup
git clone git@github.com:kwannoel/nixos-config.git ~/nixos-config/
ln -s ~/nixos-config/"$device"/boot.nix ~/nixos-config/boot.nix
ln -s ~/nixos-config/"$device"/hardware-configuration.nix ~/nixos-config/hardware-configuration.nix

# user utils
git clone git@github.com:kwannoel/user-utils.git ~/user-utils

# xmonad setup
git clone git@github.com:kwannoel/Xmonad-config.git ~/.xmonad
source ~/.xmonad/init.sh

# doom setup
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
git clone git@github.com:kwannoel/doom-config.git ~/.doom.d
source nix-config init.sh

echo "Remember to press mod-q to refresh xmonad, edit keyboard settings in window-manager.nix if necessary"
