#!/bin/bash

corePackages="tmux neovim zsh zsh-autosuggestions zsh-syntax-highlighting fzf fd fastfetch ripgrep stow github-cli"

pacmanPackages="rofi kitty dunst brightnessctl keyd qt6ct firefox obs-studio thunar tumbler thunar-archive-plugin thunar-volman imagemagick gthumb jdk17-openjdk reflector calc ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common htop papirus-icon-iheme ntp xarchiver"

yayPackages="bumblebee-status auto-cpufreq obs-websocket-compat obs-cli"

i3Packages="i3 feh xorg xorg-xinit picom maim"
swayPackages="sway swaylock swaybg swww slurp grim wl-clipboard xdg-desktop-portal xdg-desktop-portal-wlr"
hyprPackages="hyprland wofi waybar"

optionalPacmanPackages="vlc mpv lxappearance krita kdenlive kdeconnect discord jdk8-openjdk jdk21-openjdk wine winetricks steam android-file-transfer android-tools scrcpy screenkey glava dosfstools"
optionalYayPackages="cmatrix-git webcord ani-cli clementine"

graphicsPackages="libva-utils libva-intel-driver libva-mesa-driver"

bluetoothPackages="blueman bluez-utils"
if [ $# -eq 0 ]; then
    pacmanPackages="$corePackages $i3Packages $swayPackages $pacmanPackages"
else
    while [ $# -gt 0 ]; do
        case $1 in
            -c | --core-only) 
                pacmanPackages="$corePackages"
                break
                ;;
            -i | --i3) 
                pacmanPackages="$i3Packages $pacmanPackages" 
                ;;
            -s | --sway)
                pacmanPackages="$swayPackages $pacmanPackages"
                ;;
            -H | --Hyprland)
                pacmanPackages="$hyprPackages $pacmanPackages"
                ;;
            -o | --optionals)
                pacmanPackages="$pacmanPackages $optionalPacmanPackages"
                yayPackages="$yayPackages $optionalYayPackages"
                ;;
            -g | --graphics-install) 
                pacmanPackages="$pacmanPackages $graphicsPackages"
                ;;
            -b | --bluetooth-install) 
                blueset="true"
                pacmanPackages="$pacmanPackages $bluetoothPackages"
                ;;
        esac
        shift
    done
fi

# enable multilib mirror
sudo sed -i 's/#\(\[multilib\]\)/\1\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

# pacman installs
sudo pacman -Sy --noconfirm yay $pacmanPackages

yay -Sy --noconfirm $yayPackages

# install Neovim Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

system setup
sudo chsh $USER

# file setup 
mkdir $HOME/docs $HOME/Storage $HOME/projects $HOME/personal
cp -r . $HOME/.dotfiles

# stow 
oldDir=$(pwd)
cd $HOME/.dotfiles
stow .
cd $oldDir

# systemd stuff
if [ ! -z $blueset ]; then
    sudo systemctl enable bluetooth
fi
