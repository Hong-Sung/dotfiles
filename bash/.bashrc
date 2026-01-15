# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load common exports
if [ -f "$HOME/.config/shell/exports" ]; then
    source "$HOME/.config/shell/exports"
fi

# Bash specific settings
# Check window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prompt
export PS1="[\u@\h \W]\\$ "

# Load common aliases
if [ -f "$HOME/.config/shell/aliases" ]; then
    source "$HOME/.config/shell/aliases"
fi

if [ -f "$HOME/.config/shell/functions" ]; then
    source "$HOME/.config/shell/functions"
fi
