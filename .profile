# ~/.profile

# Load common exports
[ -r "$HOME/.config/shell/exports" ] && . "$HOME/.config/shell/exports"

# macOS Homebrew
if [ "$(uname)" = "Darwin" ] && [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ArduPilot development paths
[ -r "$HOME/venv-ardupilot/bin/activate" ] && . "$HOME/venv-ardupilot/bin/activate"
path_prepend /opt/gcc-arm-none-eabi-10-2020-q4-major/bin
path_prepend "$HOME/ardupilot/Tools/autotest"
path_prepend /usr/lib/ccache

[ -r "$HOME/.config/local/bin/env" ] && . "$HOME/.config/local/bin/env"
[ -r "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d "$HOME/.antigravity/antigravity/bin" ] && path_prepend "$HOME/.antigravity/antigravity/bin"

# Load .bashrc for interactive bash login shells.
if [ -n "$BASH_VERSION" ] && [ -r "$HOME/.bashrc" ]; then
    case $- in
        *i*) . "$HOME/.bashrc" ;;
    esac
fi
