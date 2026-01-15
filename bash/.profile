# ~/.profile

# Load common exports
if [ -f "$HOME/.exports" ]; then
    source "$HOME/.exports"
fi

# Add local bin to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
