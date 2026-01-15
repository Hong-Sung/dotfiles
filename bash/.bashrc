# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load common exports
if [ -f "$HOME/.exports" ]; then
    source "$HOME/.exports"
fi

# Bash specific settings
# Check window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prompt
export PS1="[\u@\h \W]\\$ "

# Load common aliases and functions
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

if [ -f "$HOME/.functions" ]; then
    source "$HOME/.functions"
fi
