# history
setopt APPEND_HISTORY                       # 세션 종료 시 기존 history에 추가
setopt HIST_IGNORE_ALL_DUPS                 # 중복은 가장 나중 것만 저장
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# bindkey
bindkey '^R' history-incremental-search-backward

# User specific alias
alias h="history 1"
alias so="source $HOME/.zshrc"
alias ve="vim $HOME/.zshenv"
alias vz="vim $HOME/.zshrc"
alias vi="vim -u $HOME/.vimrc"
alias vssh="vim $HOME/.ssh/config"
alias vgit="vim $HOME/.gitconfig"
alias vtmux="vim $HOME/.tmux.conf"
alias vgitignore="vim $HOME/.gitignore"

# dotfiles
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no

# User specific functions
ff()   { grep -Rnw . -e "$1"; }
ffc()  { grep --include=\*.c -Rnw . -e "$1"; }
ffh()  { grep --include=\*.h -Rnw . -e "$1"; }
ffch() { grep --include=\*.{c,h} -Rnw . -e "$1"; }

# Completion
autoload -U compinit; compinit

# git
git config --global core.excludesfile "$HOME/.gitignore"


# Added by Antigravity
export PATH="/Users/hoskim/.antigravity/antigravity/bin:$PATH"
