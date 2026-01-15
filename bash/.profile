# ~/.profile

# Load common exports
if [ -f "$HOME/.config/shell/exports" ]; then
    source "$HOME/.config/shell/exports"
fi

# Add local bin to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
