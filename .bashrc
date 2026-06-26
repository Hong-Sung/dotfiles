# ~/.bashrc

case $- in
    *i*) ;;
    *) return ;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load common exports, aliases, and functions
[ -r "$HOME/.config/shell/exports" ] && . "$HOME/.config/shell/exports"
[ -r "$HOME/.config/shell/aliases" ] && . "$HOME/.config/shell/aliases"
[ -r "$HOME/.config/shell/functions" ] && . "$HOME/.config/shell/functions"

# Bash specific settings
shopt -s checkwinsize
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups

# Prompt
export PS1="[\u@\h \W]\\$ "

# Bash specific aliases
alias h="history"
alias so="source $HOME/.bashrc"
alias vs="vim $HOME/.bashrc"
alias ve="vim $HOME/.profile"

# completions
[ -r "$HOME/ardupilot/Tools/completion/completion.bash" ] && . "$HOME/ardupilot/Tools/completion/completion.bash"

# fzf
if command -v fzf > /dev/null 2>&1 && fzf --bash > /dev/null 2>&1; then
    eval "$(fzf --bash)"
fi

# zoxide
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init bash)"

# starship
command -v starship > /dev/null 2>&1 && eval "$(starship init bash)"

# ROS
[ -r /opt/ros/jazzy/setup.bash ] && . /opt/ros/jazzy/setup.bash

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

[ -r "$HOME/.config/local/bin/env" ] && . "$HOME/.config/local/bin/env"
[ -r "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d "$HOME/.antigravity/antigravity/bin" ] && path_prepend "$HOME/.antigravity/antigravity/bin"
