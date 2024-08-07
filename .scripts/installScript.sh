#!/bin/bash

sudo pacman -Sy --noconfirm --needed git go base-devel
mkdir $HOME/git
git clone https://aur.archlinux.org/yay $HOME/git/yay
oldDir=$(pwd)
cd $HOME/git/yay
makepkg -si
cd $oldDir

sudo sed -i 's/#\(\[multilib\]\)/\1\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc//pacman.conf
# pacman installs
sudo pacman -S --noconfirm sway i3 rofi tmux neovim zsh zsh-autosuggestions zsh-syntax-highlighting fzf kitty dunst picom vlc mpv slurp grim brightnessctl keyd fastfetch github-cli stow discord qt6ct firefox krita kdenlive obs-studio lxappearance thunar thunar-archive-plugin thunar-volman imagemagick gthumb jdk8-openjdk jdk17-openjdk jdk21-openjdk android-tools scrcpy reflector swww calc ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common wine winetricks steam

yay -Sy --noconfirm bumblebee-status cmatrix-git webcord auto-cpufreq obs-websocket-compat obs-cli ani-cli clementine

# system setup
sudo chsh $USER /bin/zsh

# file setup 
mkdir $HOME/.dotfiles
git clone https://github.com/redflameken2/neodotfiles $HOME/.dotfiles

# stow 
oldDir=$(pwd)
cd $HOME/.dotfiles
stow .
cd $oldDir
