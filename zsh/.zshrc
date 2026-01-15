# history
setopt APPEND_HISTORY                       # 세션 종료 시 기존 history에 추가
setopt HIST_IGNORE_ALL_DUPS                 # 중복은 가장 나중 것만 저장
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# bindkey
bindkey '^R' history-incremental-search-backward

# Load common aliases
if [ -f "$HOME/.config/shell/aliases" ]; then
    source "$HOME/.config/shell/aliases"
fi

# Load common functions
if [ -f "$HOME/.config/shell/functions" ]; then
    source "$HOME/.config/shell/functions"
fi

# Zsh specific aliases
alias so="source $HOME/.zshrc"
alias vs="vim $HOME/.zshrc"
alias ve="vim $HOME/.zshenv"

# Completion
autoload -U compinit; compinit

# git
git config --global core.excludesfile "$HOME/.gitignore"
