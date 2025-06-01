#!/bin/bash

core_packages="tmux neovim zsh zsh-autosuggestions zsh-syntax-highlighting fzf fastfetch ripgrep github-cli tlp npm zip unzip"

pacman_packages="rofi alacritty dunst brightnessctl keyd qt6ct obs-studio thunar tumbler thunar-archive-plugin thunar-volman imagemagick gthumb jdk17-openjdk reflector calc htop papirus-icon-theme ntp xarchiver"

font_packages="noto-fonts-emoji ttf-firacode-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common"

yay_packages="obs-websocket-compat obs-cli"

yay_browser_packages="floorp-bin"

i3_packages="i3 feh xorg xorg-xinit picom maim"

sway_packages="sway swaylock swaybg slurp grim wl-clipboard"
yay_sway_packages="bumblebee-status"

hypr_packages="hyprland swww waybar xdg-desktop-portal xdg-desktop-portal-wlr"

optional_pacman_packages="mpv lxappearance krita kdenlive kdeconnect discord jdk8-openjdk jdk21-openjdk wine winetricks steam android-file-transfer android-tools scrcpy screenkey glava dosfstools rhythmbox"
optional_yay_packages="cmatrix-git ani-cli"

graphics_packages="libva-utils libva-intel-driver libva-mesa-driver"

bluetooth_packages="blueman bluez-utils"

install_yay=false
install_browser=true

post_setup(){
    ln -sf $HOME/docs $HOME/Documents
    cp $HOME/.dotfiles/etc/tlp.conf $HOME/.config/tlp.conf
    sudo ln -sf /home/kenneth/.config/tlp.conf /etc/tlp.conf
}

print_help(){
printf "installScript.sh [options]

options:
  -C, --core-only         Install only core components of the setup\n
  -a, --all               Install all packages
  -c, --core              Install the core components of the setup\n
  -i, --i3                Install packages needed for i3\n
  -s, --sway              Install packages needed for sway\n
  -H, --hyprland          Install packages needed for Hyprland\n
  -o, --optionals         Install optional packages that are used in the setup\n
  -g, --graphics-install  Install packages related to graphics\n
  -f, --fonts             Install font packages used in the setup\n
  -b, --bluetooth-install Install packages for bluetooth functionality\n
  -n, --no-postinstall    Only install packages. do not do post install setup\n
  -h, --help              Print this help message\n
"
}

if [ $# -eq 0 ]; then
    pacman_packages="$core_packages $i3_packages $sway_packages $pacman_packages $font_packages"
else
    while [ $# -gt 0 ]; do
        case $1 in
            -C | --core-only) 
                pacman_packages="$core_packages"
                install_browser=false
                break
                ;;
            -a | --all) 
                pacman_packages="$pacman_packages $core_packages $i3_packages $sway_packages $hypr_packages $optional_pacman_packages $graphics_packages $font_packages $bluetooth_packages" 
                yay_packages="$yay_packages $yay_sway_packages $optional_yay_packages"
                install_yay=true
                blueset="true"
                break
                ;;
            -n | --no-postinstall) no_postinstall=true
                ;;
            -c | --core) 
                pacman_packages="$pacman_packages $core_packages" 
                ;;
            -i | --i3) 
                pacman_packages="$pacman_packages $i3_packages" 
                ;;
            -s | --sway)
                pacman_packages="$pacman_packages $sway_packages"
                yay_packages="$yay_packages $yay_sway_packages"
                install_yay=true
                ;;
            -H | --hyprland)
                pacman_packages="$pacman_packages $hypr_packages"
                ;;
            -o | --optionals)
                pacman_packages="$pacman_packages $optional_pacman_packages"
                yay_packages="$yay_packages $optional_yay_packages"
                install_yay=true
                ;;
            -g | --graphics-install) 
                pacman_packages="$pacman_packages $graphics_packages"
                ;;
            -f | --fonts) 
                pacman_packages="$pacman_packages $font_packages"
                ;;
            -b | --bluetooth-install) 
                blueset="true"
                pacman_packages="$pacman_packages $bluetooth_packages"
                ;;
            -h | --help)
                print_help
                exit
                ;;
            *)
                printf "invalid option $1!\n"
                print_help
                exit
                ;;
        esac
        shift
    done
fi

# enable multilib mirror
sudo sed -i 's/#\(\[multilib\]\)/\1\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

# pacman installs
sudo pacman -Sy --noconfirm --needed $pacman_packages

if [ $install_yay == true ]; then
    yay -Sy --noconfirm --needed $yay_packages
fi

if [ $install_browser == true ]; then
    yay -Sy --noconfirm --needed $yay_browser_packages
fi

# install Neovim Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# system setup
sudo chsh -s /bin/zsh $USER

if [ $no_postinstall == true ]; then
    exit;
fi

# file setup 
create_dir(){
    if [ ! -d $1 ]; then
        mkdir $1
        printf "Created the directory: $1\n"
    fi
}

create_dir $HOME/docs
create_dir $HOME/docs/notes
create_dir $HOME/Storage
create_dir $HOME/projects
create_dir $HOME/personal
create_dir $HOME/test
create_dir $HOME/school

create_dir $HOME/libs
create_dir $HOME/.local/bin
create_dir $HOME/.config/


curDir=$(pwd)
if [ "$curDir" == "$HOME/.dotfiles" ]; then
    printf "Already in .dotfiles, not copying repo\n"
else
    cp -r . $HOME/.dotfiles
fi

$HOME/.dotfiles/deploy reset

# systemd stuff
if [ ! -z $blueset ]; then
    sudo systemctl enable bluetooth
fi

post_setup
