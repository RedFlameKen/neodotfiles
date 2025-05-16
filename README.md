# Redflameken's NeoDotfiles

This will now be my main dotfiles repo that includes all of my setups
(Hyprland, i3, sway)

To install the dotfiles, I have made an install script (currently very new and
needs many improvements:
```
mkdir $HOME/git
git clone https://github.com/redflameken2/neodotfiles $HOME/git/neodotfiles
chmod +x $HOME/git/neodotfiles/installScript.sh
$HOME/git/neodotfiles/installScript.sh
```
Afterwards, just wait for pacman and yay to do their thing and BOOM, you have a
copy of my system now! <br>

# TODO
I've not properly maintained my dotfiles in a bit. It's started to become hard
for me to reinstall my system if I wanted. Will list down TODOs to keep track
of what I need to do for this.
- [ ] Create a custom alternative to stow
- [ ] Update install script
