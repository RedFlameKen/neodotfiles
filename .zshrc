# fpath+=($HOME/.zsh/pure)

# prompt pure

setopt histignorealldups sharehistory

# export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude={.metadata,.git,.settings} --search-path $HOME/projects --search-path $HOME/school --search-path $HOME/.config/nvim --search-path $HOME/.config/i3 --search-path $HOME/.config/hypr --search-path $HOME/.config/sway --search-path $HOME/.config/rofi --search-path $HOME/.config/wofi"
EDITOR=nvim
QT_QPA_PLATFORMTHEME=qt6ct
WINEARCH=win64
WINEPREFIX=~/wine/kennethWine
PATH="$HOME/.local/bin:$PATH"
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e
bindkey -v
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line

tmuxfuz() {
}
zle -N tmuxfuz

bindkey -s '^F' '~/.local/bin/tmux-fuzzy-session\n'
bindkey -s '^[^F' '~/.local/bin/tmux-fuzzy-session -v\n'

source <(fzf --zsh)

# Use modern completion system
autoload -Uz promptinit
promptinit
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
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

GRAY_FG=$(tput setaf 240)
GRAY_BG=$(tput setab 240)

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

setopt PROMPT_SUBST

colorize(){
    echo $2$3$4$1$RESET
}
source ~/.git-prompt.sh
git_status(){
    echo "$(__git_ps1 "  %s ")"
}
# source ~/.git-completion.zsh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCONFLICTSTATE="yes"
PROMPT='
$(colorize "" $BOLD $RED_FG)'
PROMPT+='$(colorize "󰣇 %n " $BOLD $LWHITE_FG $RED_BG)'
PROMPT+='$(colorize "" $RED_FG $DDBLACK_BG)'
PROMPT+='$(colorize " %~ " $BOLD $LWHITE_FG $DDBLACK_BG)'
PROMPT+='$(colorize "" $DDBLACK_FG $GRAY_BG)'
PROMPT+='$(colorize "$(git_status)" $BOLD $LWHITE_FG $GRAY_BG)'
PROMPT+='$(colorize "" $GRAY_FG $GREEN_BG)'
PROMPT+='$(colorize " %@" $BOLD $LWHITE_FG $GREEN_BG)'
PROMPT+='$(colorize "" $GREEN_FG )'
PROMPT+='
$(colorize " 󰜴 " $YELLOW_FG)'
