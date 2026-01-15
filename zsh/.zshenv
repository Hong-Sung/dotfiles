#!/usr/bin/env zsh

# Load common exports
if [ -f "$HOME/.exports" ]; then
    source "$HOME/.exports"
fi

# zsh
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000


