#!/bin/bash

sudo pacman -Sy --needed git go base-devel
mkdir $HOME/git
git clone https://aur.archlinux.org/yay $HOME/git/yay
oldDir=$(pwd)
cd $HOME/git/yay
makepkg -si
cd $oldDir

# pacman installs
sudo pacman -S sway i3 rofi tmux neovim kitty picom keyd fastfetch dunst github-cli ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common stow discord qt6ct firefox kritta kdenlive obs-studio steam lxappearacne thunar thunar-volman imagemagick gthumb wine winetricks g++ jdk8-openjdk jdk17-openjdk jdk21-openjdk android-tools scrcpy reflector vlc mpv zsh zsh-autosuggestions zsh-syntax-highlighting slurp grim brightnessctl swww calc xwayland
yay -Sy bumblebee-status cmatrix-git webcord auto-cpufreq obs-websocket-compat obs-cli ani-cli clementine

# file setup 
mkdir $HOME/.dotfiles
git clone https://github.com/redflameken2/neodotfiles $HOME/.dotfiles

# stow 
oldDir=$(pwd)
cd $HOME/.dotfiles
stow .
cd $oldDir
