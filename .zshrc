# history
setopt APPEND_HISTORY                       # 세션 종료 시 기존 history에 추가
setopt HIST_IGNORE_ALL_DUPS                 # 중복은 가장 나중 것만 저장
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# bindkey
bindkey '^R' history-incremental-search-backward

# Load common aliases and functions
[[ -r "$HOME/.config/shell/aliases" ]] && source "$HOME/.config/shell/aliases"
[[ -r "$HOME/.config/shell/functions" ]] && source "$HOME/.config/shell/functions"

# Zsh specific aliases
alias h="history 1"
alias so="source $HOME/.zshrc"
alias vs="vim $HOME/.zshrc"
alias ve="vim $HOME/.zshenv"

# Completion
autoload -U compinit; compinit

# fzf
if command -v fzf > /dev/null 2>&1 && fzf --zsh > /dev/null 2>&1; then
    source <(fzf --zsh)
fi

# zoxide
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init zsh)"

# starship
command -v starship > /dev/null 2>&1 && eval "$(starship init zsh)"

# ROS
[[ -r /opt/ros/jazzy/setup.zsh ]] && source /opt/ros/jazzy/setup.zsh

# nvm
export NVM_DIR="$HOME/.config/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

[[ -r "$HOME/.config/local/bin/env" ]] && . "$HOME/.config/local/bin/env"
[[ -r "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && path_prepend "$HOME/.antigravity/antigravity/bin"
