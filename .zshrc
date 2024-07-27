fpath+=($HOME/.zsh/pure)

autoload -Uz promptinit
promptinit
prompt pure

setopt histignorealldups sharehistory

# export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude={.metadata,.git,.settings} --search-path $HOME/projects --search-path $HOME/school --search-path $HOME/.config/nvim --search-path $HOME/.config/i3 --search-path $HOME/.config/hypr --search-path $HOME/.config/sway --search-path $HOME/.config/rofi --search-path $HOME/.config/wofi"
EDITOR=nvim
QT_QPA_PLATFORMTHEME=qt6ct
WINEARCH=win64
WINEPREFIX=~/wine/kennethWine
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

bindkey -s '^F' '~/git/redflameken/tmux-fuzzy-session/tmux-fuzzy-session.sh\n'
bindkey -s '^[^F' '~/git/redflameken/tmux-fuzzy-session/tmux-fuzzy-session.sh vim\n'

source <(fzf --zsh)

# Use modern completion system
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

cd .
