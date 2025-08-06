#!/usr/bin/env zsh

export LANG=en_US.UTF-8

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# editor
export EDITOR="vim"
export VISUAL="vim"

# zsh
#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# PATH
export PATH=$XDG_CONFIG_HOME/bin:$PATH

# SSH
export SSH_ENV="$HOME/.ssh/agent-environment"

# DPDK PKG_CONFIG_PATH
#export PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:$(pkg-config --variable pc_path pkg-config | tr ' ' ':')
