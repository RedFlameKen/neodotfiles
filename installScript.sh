#!/bin/bash

pacmanPackages="rofi tmux neovim zsh zsh-autosuggestions zsh-syntax-highlighting fzf kitty dunst brightnessctl keyd fastfetch github-cli stow qt6ct firefox obs-studio thunar thunar-archive-plugin thunar-volman imagemagick gthumb jdk17-openjdk reflector calc ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common"
yayPackages="bumblebee-status auto-cpufreq obs-websocket-compat obs-cli"

i3Packages="i3 feh xorg xorg-xinit picom"
swayPackages="sway swaylock swww slurp grim"

optionalPacmanPackages="vlc mpv lxappearance krita kdenlive kdeconnect discord jdk8-openjdk jdk21-openjdk wine winetricks steam android-file-transfer android-tools scrcpy screenkey wofi"
optionalYayPackages="cmatrix-git webcord ani-cli clementine"

if [ $# -eq 0 ]; then
    pacmanPackages="$i3Packages $swayPackages $pacmanPackages"
else
    while [ $# -gt 0 ]; do
        case $1 in
            -i | --i3) 
                pacmanPackages="$i3Packages $pacmanPackages" 
                ;;
            -s | --sway)
                pacmanPackages="$swayPackages $pacmanPackages"
                ;;
            -o | --optionals)
                pacmanPackages="$pacmanPackages $optionalPacmanPackages"
                yayPackages="$yayPackages $optionalYayPackages"
                ;;
            -Y | --skip-yay-install) 
                skipYay="true"
                ;;
        esac
        shift
    done
fi

# install yay
if [ -z $skipYay ]; then
    sudo pacman -Sy --noconfirm --needed git go base-devel
    mkdir $HOME/git
    git clone https://aur.archlinux.org/yay $HOME/git/yay
    oldDir=$(pwd)
    cd $HOME/git/yay
    makepkg -si
    cd $oldDir
fi

# enable multilib mirror
sudo sed -i 's/#\(\[multilib\]\)/\1\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

# pacman installs
sudo pacman -Sy --noconfirm $pacmanPackages

yay -Sy --noconfirm $yayPackages

# system setup
sudo chsh $USER /bin/zsh

# file setup 
mkdir $HOME/docs $HOME/Storage $HOME/projects $HOME/personal
cp -r . $HOME/.dotfiles

# stow 
oldDir=$(pwd)
cd $HOME/.dotfiles
stow .
cd $oldDir
