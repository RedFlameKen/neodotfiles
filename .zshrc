# Source
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.git-prompt.sh
# source <(fzf --zsh)
# source ~/.git-completion.zsh

if [ -f ~/.sh_profile ]; then
    source ~/.sh_profile
fi
# if [ -f ~/.config/.sh_prompt ]; then
#     source ~/.config/.sh_prompt
# fi
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

setopt histignorealldups sharehistory PROMPT_SUBST

function tmux-fuz-sesh {
    zsh -c ~/.local/bin/muxfind
}

function tmux-fuz-sesh-vim {
    zsh -c ~/.local/bin/muxfind -v
}

zle -N tmux-fuz-sesh
zle -N tmux-fuz-sesh-vim

bindkey -v
bindkey '^[[3;5~' kill-word
# bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line

# bindkey '^F' tmux-fuz-sesh
# bindkey '^[^F' tmux-fuz-sesh-vim

bindkey -s '^A' 'tmux a\n'

bindkey -s '^F' '~/.local/bin/muxfind\n'
bindkey -s '^[^F' '~/.local/bin/muxfind -v\n'


autoload -Uz bashcompinit
bashcompinit

autoload -Uz compinit
compinit


source <(fzf --zsh)

RESET="%{$(tput sgr0)%}"
BOLD="%{$(tput bold)%}"
UNDERLINE="%{$(tput smul)%}"
# REVERSE="%{$(tput )%}"

# Color Characters
RED_FG="%{$(tput setaf 1)%}"
RED_BG="%{$(tput setab 1)%}"

GREEN_FG="%{$(tput setaf 2)%}"
GREEN_BG="%{$(tput setab 2)%}"

YELLOW_FG="%{$(tput setaf 3)%}"
YELLOW_BG="%{$(tput setab 3)%}"

BLUE_FG="%{$(tput setaf 4)%}"
BLUE_BG="%{$(tput setab 4)%}"

MAGENTA_FG="%{$(tput setaf 5)%}"
MAGENTA_BG="%{$(tput setab 5)%}"

CYAN_FG="%{$(tput setaf 6)%}"
CYAN_BG="%{$(tput setab 6)%}"

WHITE_FG="%{$(tput setaf 7)%}"
WHITE_BG="%{$(tput setab 7)%}"

BLACK_FG="%{$(tput setaf 8)%}"
BLACK_BG="%{$(tput setab 8)%}"

LRED_FG="%{$(tput setaf 9)%}"
LRED_BG="%{$(tput setab 9)%}"

LGREEN_FG="%{$(tput setaf 10)%}"
LGREEN_BG="%{$(tput setab 10)%}"

LYELLOW_FG="%{$(tput setaf 11)%}"
LYELLOW_BG="%{$(tput setab 11)%}"

LBLUE_FG="%{$(tput setaf 12)%}"
LBLUE_BG="%{$(tput setab 12)%}"

LMAGENTA_FG="%{$(tput setaf 13)%}"
LMAGENTA_BG="%{$(tput setab 13)%}"

LCYAN_FG="%{$(tput setaf 14)%}"
LCYAN_BG="%{$(tput setab 14)%}"

LWHITE_FG="%{$(tput setaf 15)%}"
LWHITE_BG="%{$(tput setab 15)%}"

GRAY_FG="%{$(tput setaf 240)%}"
GRAY_BG="%{$(tput setab 240)%}"

DBLACK_FG="%{$(tput setaf 16)%}"
DBLACK_BG="%{$(tput setab 16)%}"

DDBLACK_FG="%{$(tput setaf 237)%}"
DDBLACK_BG="%{$(tput setab 237)%}"

ORANGE_FG="%{$(tput setaf 202)%}"
ORANGE_BG="%{$(tput setab 202)%}"

GBLUE1_FG="%{$(tput setaf 19)%}"
GBLUE1_BG="%{$(tput setab 19)%}"

GBLUE2_FG="%{$(tput setaf 20)%}"
GBLUE2_BG="%{$(tput setab 20)%}"

GBLUE3_FG="%{$(tput setaf 21)%}"
GBLUE3_BG="%{$(tput setab 21)%}"

colorize(){
    echo "%{$2$3$4%}$1$RESET"
}

if [ $TERM = "linux" ]; then
    BACK_LINE_TOP="╔═"
    BACK_LINE_BOT="╚═"
    BG_ICON="  "
    SEP1=""
    SEP2=""
    SEP3=""
    SEP4=" "
    ARROW_ICON=">"
    USR_ICON=""
    BRANCH_ICON=""
    NORMALMODE="=NRM"
    INSERTMODE="=INS"
else
    BACK_LINE_TOP="╭─"
    BACK_LINE_BOT="╰─"
    BG_ICON="  "
    SEP1=""
    SEP2=""
    SEP3=""
    # SEP4=""
    SEP4="  "
    ARROW_ICON="󰜴"
    USR_ICON="󰣇"
    CLOCK_ICON="󰥔"
    BRANCH_ICON=""
    NORMALMODE="NRM"
    INSERTMODE="INS"
fi

bg_process(){
    echo "$(colorize $BG_ICON $BOLD $RED_FG)"
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
git_status(){
    echo "%{$(__git_ps1 " $BRANCH_ICON %s " 2>/dev/null)%}"
}

vimode="INS"
function zle-keymap-select {
    vimode="${${KEYMAP/vicmd/$NORMALMODE}/(main|viins)/$INSERTMODE}"
    zle reset-prompt
}

zle -N zle-keymap-select

PROMPT='
$BACK_LINE_TOP$(colorize $SEP1 $BOLD $RED_FG)'
PROMPT+='$(colorize "$USR_ICON %n " $BOLD $LWHITE_FG $RED_BG)'
PROMPT+='$(colorize  $SEP3 $RED_FG $DDBLACK_BG)'
PROMPT+='$(colorize " %~ " $BOLD $LWHITE_FG $DDBLACK_BG)'
PROMPT+='$(colorize $SEP3 $DDBLACK_FG $GRAY_BG)'
PROMPT+='$(colorize "$(git_status)" $BOLD $LWHITE_FG $GRAY_BG)'
PROMPT+='$(colorize $SEP3 $GRAY_FG $GREEN_BG)'
PROMPT+='$(colorize " $CLOCK_ICON %D{%H:%M}" $BOLD $LWHITE_FG $GREEN_BG)'
PROMPT+='$(colorize $SEP2 $GREEN_FG )'
PROMPT+='
$BACK_LINE_BOT$(colorize $SEP1 $YELLOW_FG)'
PROMPT+='$(colorize "$vimode" $BOLD $DBLACK_FG $YELLOW_BG)'
PROMPT+='$(colorize "%(1j.$(bg_process).) " $BOLD $DBLACK_FG $YELLOW_BG)'
PROMPT+='$(colorize $SEP4 $YELLOW_FG )'
# PROMPT+='$(colorize " $ARROW_ICON " $YELLOW_FG)'
