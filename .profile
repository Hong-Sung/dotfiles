# ~/.profile

# Load common exports
if [ -f "$HOME/.config/shell/exports" ]; then
    source "$HOME/.config/shell/exports"
fi

# PATH
if [ "$(uname)" = "Darwin" ] && [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.antigravity/antigravity/bin" ] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Load .bashrc for interactive settings (aliases, functions, prompt)
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
