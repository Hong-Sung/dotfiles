# homebrew
if [[ "$OSTYPE" == "darwin"* ]] && [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# PATH
export PATH="$HOME/.config/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
