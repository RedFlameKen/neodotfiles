#Icons
#   User:  
#   Folder:  
#   Git:  
#   arrow: 󰜴 
#   Outer Block:  
#   Separator:    


# Modifier Characters
RESET=$(tput sgr0)
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
# REVERSE=$(tput )

# Color Characters
RED_FG=$(tput setaf 1)
RED_BG=$(tput setab 1)

GREEN_FG=$(tput setaf 2)
GREEN_BG=$(tput setab 2)

YELLOW_FG=$(tput setaf 3)
YELLOW_BG=$(tput setab 3)

BLUE_FG=$(tput setaf 4)
BLUE_BG=$(tput setab 4)

MAGENTA_FG=$(tput setaf 5)
MAGENTA_BG=$(tput setab 5)

CYAN_FG=$(tput setaf 6)
CYAN_BG=$(tput setab 6)

WHITE_FG=$(tput setaf 7)
WHITE_BG=$(tput setab 7)

BLACK_FG=$(tput setaf 8)
BLACK_BG=$(tput setab 8)

LRED_FG=$(tput setaf 9)
LRED_BG=$(tput setab 9)

LGREEN_FG=$(tput setaf 10)
LGREEN_BG=$(tput setab 10)

LYELLOW_FG=$(tput setaf 11)
LYELLOW_BG=$(tput setab 11)

LBLUE_FG=$(tput setaf 12)
LBLUE_BG=$(tput setab 12)

LMAGENTA_FG=$(tput setaf 13)
LMAGENTA_BG=$(tput setab 13)

LCYAN_FG=$(tput setaf 14)
LCYAN_BG=$(tput setab 14)

LWHITE_FG=$(tput setaf 15)
LWHITE_BG=$(tput setab 15)

DBLACK_FG=$(tput setaf 16)
DBLACK_BG=$(tput setab 16)

DDBLACK_FG=$(tput setaf 237)
DDBLACK_BG=$(tput setab 237)

ORANGE_FG=$(tput setaf 202)
ORANGE_BG=$(tput setab 202)

GBLUE1_FG=$(tput setaf 19)
GBLUE1_BG=$(tput setab 19)

GBLUE2_FG=$(tput setaf 20)
GBLUE2_BG=$(tput setab 20)

GBLUE3_FG=$(tput setaf 21)
GBLUE3_BG=$(tput setab 21)

colorize(){
    echo $2$3$4$1$RESET
}

source ~/.git-completion.bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
# $(colorize '' $BOLD $RED_FG )
PS1="\n$(colorize '' $BOLD $RED_FG)"
PS1+="$(colorize '\u ' $BOLD $LWHITE_FG $RED_BG)"
PS1+="$(colorize '' $RED_FG $DDBLACK_BG)"
PS1+="$(colorize ' \w ' $BOLD $LWHITE_FG $DDBLACK_BG)"
PS1+="$(colorize '' $DDBLACK_FG $BLUE_BG)"
PS1+="$(colorize '$(__git_ps1 "  %s ")' $BOLD $LWHITE_FG $BLUE_BG)"
PS1+="$(colorize '' $BLUE_FG $GREEN_BG)"
PS1+="$(colorize ' \@' $BOLD $LWHITE_FG $GREEN_BG)"
PS1+="$(colorize '' $GREEN_FG )"
PS1+="\n $(colorize '󰜴 ' $YELLOW_FG)"

# PS1="\n$(colorize '' $BOLD $DDBLACK_FG)"
# PS1+="$(colorize '\u ' $LWHITE_FG $DDBLACK_BG)"
# PS1+="$(colorize '' $DDBLACK_FG $BLUE_BG)"
# PS1+="$(colorize ' \w ' $BOLD $LWHITE_FG $BLUE_BG)"
# PS1+="$(colorize '' $BLUE_FG $ORANGE_BG)"
# PS1+="$(colorize '$(__git_ps1 "  %s ")' $BOLD $LWHITE_FG $ORANGE_BG)"
# PS1+="$(colorize '' $ORANGE_FG $GREEN_BG)"
# PS1+="$(colorize '' $BOLD $LWHITE_FG $GREEN_BG)"
# PS1+="$(colorize '' $GREEN_FG )"
# PS1+="\n $(colorize '󰜴 ' $YELLOW_FG)"


export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude={.vscode,.git,wine,.wine,.local,.var,.steam,.npm,.gradle,.android,.cache,.tlauncher,.steam,.m2,.rustup,.cargo} --search-path $HOME/docs --search-path $HOME/.config/nvim --search-path $HOME/.config/i3 --search-path $HOME/.config/hypr --search-path $HOME/.config/sway --search-path $HOME/.config/rofi --search-path $HOME/.config/wofi --search-path $HOME/git"
EDITOR=nvim
QT_QPA_PLATFORMTHEME=qt6ct
WINEARCH=win64
WINEPREFIX=~/wine/kennethWine


HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
source <(fzf --bash)

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
