# SSH agent-forwarding 소켓은 접속마다 경로가 바뀌는데, 이미 떠 있는 tmux
# pane은 생성 시점 환경변수를 그대로 물고 있어 재접속 후 죽은 소켓을 참조하게 됨.
# 안정적인 심볼릭 링크를 매 셸 시작 시 최신 소켓으로 갱신하고, 항상 그 링크
# 경로를 SSH_AUTH_SOCK으로 사용해 기존 pane에서도 최신 소켓을 따라가게 한다.
if [ -n "$SSH_AUTH_SOCK" ] && [ -S "$SSH_AUTH_SOCK" ] && [ "$SSH_AUTH_SOCK" != "$HOME/.ssh/ssh_auth_sock" ]; then
    ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_auth_sock"
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"

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
if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    print -P "%F{yellow}[zshrc] starship 미설치 → 기본 프롬프트 사용 (curl -sS https://starship.rs/install.sh | sh)%f"
    PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
fi

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

# >>> Codex installer >>>
[[ "$OSTYPE" == linux* ]] && export PATH="/home/hoskim/.local/bin:$PATH"
# <<< Codex installer <<<

[[ -d "$HOME/Library/Android/sdk/platform-tools" ]] && path_prepend "$HOME/Library/Android/sdk/platform-tools"
[[ -r "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
