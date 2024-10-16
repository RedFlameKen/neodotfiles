source ~/.git-prompt.sh
source ~/.git-completion.bash
source <(fzf --bash)

if [ -f ~/.sh_profile ]; then
    . ~/.sh_profile
fi
if [ -f ~/.config/.sh_prompt ]; then
    . ~/.config/.sh_prompt
fi
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# bind '\C-F':'~/.local/bin/tmux-fuzzy-session\n'
# bind '^[^F' '~/.local/bin/tmux-fuzzy-session -v\n'

bind -x '"\C-F":"~/.local/bin/tmux-fuzzy-session"'
bind -x '"\e\C-F":"~/.local/bin/tmux-fuzzy-session -v"'

bind -x '"\C-A":"tmux a"'

# Modifier Characters
RESET="$(tput sgr0)"
BOLD="$(tput bold)"
UNDERLINE="$(tput smul)"
# REVERSE="$(tput )"

# Color Characters
RED_FG="$(tput setaf 1)"
RED_BG="$(tput setab 1)"

GREEN_FG="$(tput setaf 2)"
GREEN_BG="$(tput setab 2)"

YELLOW_FG="$(tput setaf 3)"
YELLOW_BG="$(tput setab 3)"

BLUE_FG="$(tput setaf 4)"
BLUE_BG="$(tput setab 4)"

MAGENTA_FG="$(tput setaf 5)"
MAGENTA_BG="$(tput setab 5)"

CYAN_FG="$(tput setaf 6)"
CYAN_BG="$(tput setab 6)"

WHITE_FG="$(tput setaf 7)"
WHITE_BG="$(tput setab 7)"

BLACK_FG="$(tput setaf 8)"
BLACK_BG="$(tput setab 8)"

LRED_FG="$(tput setaf 9)"
LRED_BG="$(tput setab 9)"

LGREEN_FG="$(tput setaf 10)"
LGREEN_BG="$(tput setab 10)"

LYELLOW_FG="$(tput setaf 11)"
LYELLOW_BG="$(tput setab 11)"

LBLUE_FG="$(tput setaf 12)"
LBLUE_BG="$(tput setab 12)"

LMAGENTA_FG="$(tput setaf 13)"
LMAGENTA_BG="$(tput setab 13)"

LCYAN_FG="$(tput setaf 14)"
LCYAN_BG="$(tput setab 14)"

LWHITE_FG="$(tput setaf 15)"
LWHITE_BG="$(tput setab 15)"

GRAY_FG="$(tput setaf 240)"
GRAY_BG="$(tput setab 240)"

DBLACK_FG="$(tput setaf 16)"
DBLACK_BG="$(tput setab 16)"

DDBLACK_FG="$(tput setaf 237)"
DDBLACK_BG="$(tput setab 237)"

ORANGE_FG="$(tput setaf 202)"
ORANGE_BG="$(tput setab 202)"

GBLUE1_FG="$(tput setaf 19)"
GBLUE1_BG="$(tput setab 19)"

GBLUE2_FG="$(tput setaf 20)"
GBLUE2_BG="$(tput setab 20)"

GBLUE3_FG="$(tput setaf 21)"
GBLUE3_BG="$(tput setab 21)"


colorize(){
    echo "$2$3$4$1$RESET"
}


if [ $TERM = "linux" ]; then
    BACK_LINE_TOP="╔═"
    BACK_LINE_BOT="╚═"
    BG_ICON="  "
    SEP1=""
    SEP2=""
    SEP3=""
    ARROW_ICON=">"
    USR_ICON=""
    BRANCH_ICON=""
else
    BACK_LINE_TOP="╭─"
    BACK_LINE_BOT="╰─"
    BG_ICON="  "
    SEP1=""
    SEP2=""
    SEP3=""
    ARROW_ICON="󰜴"
    CLOCK_ICON="󰥔"
    USR_ICON="󰣇"
    BRANCH_ICON=""
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
git_status(){
    echo "$(__git_ps1 "  %s " 2>/dev/null)"
}

PS1='
$BACK_LINE_TOP$(colorize $SEP1 $BOLD $RED_FG)'
PS1+='$(colorize "$USR_ICON \u " $BOLD $LWHITE_FG $RED_BG)'
PS1+='$(colorize  $SEP3 $RED_FG $DDBLACK_BG)'
PS1+='$(colorize " \w " $BOLD $LWHITE_FG $DDBLACK_BG)'
PS1+='$(colorize $SEP3 $DDBLACK_FG $GRAY_BG)'
PS1+='$(colorize "$(git_status)" $BOLD $LWHITE_FG $GRAY_BG)'
PS1+='$(colorize $SEP3 $GRAY_FG $GREEN_BG)'
PS1+='$(colorize " $CLOCK_ICON \D{%H:%M}" $BOLD $LWHITE_FG $GREEN_BG)'
PS1+='$(colorize $SEP2 $GREEN_FG )'
PS1+='
$BACK_LINE_BOT$(colorize " $ARROW_ICON " $YELLOW_FG)'

shopt -s checkwinsize

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
