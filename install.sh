#!/usr/bin/env bash
# dotfiles 설치 스크립트
#   curl -fsSL https://raw.githubusercontent.com/Hong-Sung/dotfiles/main/install.sh | bash
#
# 환경변수로 덮어쓰기 가능:
#   DOTFILES_REPO  (기본: https://github.com/Hong-Sung/dotfiles.git)
#   DOTFILES_DIR   (기본: $HOME/.dotfiles)
set -euo pipefail

REPO="${DOTFILES_REPO:-https://github.com/Hong-Sung/dotfiles.git}"
GIT_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

dot() { git --git-dir="$GIT_DIR" --work-tree="$HOME" "$@"; }
info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

command -v git > /dev/null 2>&1 || { echo "git이 필요합니다." >&2; exit 1; }

if [ -d "$GIT_DIR" ]; then
    info "이미 설치됨: $GIT_DIR → pull"
    dot pull --rebase
    exit 0
fi

info "bare repo 클론: $REPO → $GIT_DIR"
git clone --bare "$REPO" "$GIT_DIR"

dot config --local status.showUntrackedFiles no
dot config --local pull.rebase true
# bare 클론은 fetch refspec이 없어 origin/* 추적 브랜치가 생기지 않음
dot config --local remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
dot fetch -q origin

# 저장소 관리용 파일은 $HOME에 체크아웃하지 않음
dot config --local core.sparseCheckout true
printf '/*\n!/README.md\n!/install.sh\n' > "$GIT_DIR/info/sparse-checkout"

# 기존 파일과 겹치는 경우 백업
info "기존 파일 확인"
backed_up=0
while IFS= read -r f; do
    case "$f" in README.md|install.sh) continue ;; esac
    if [ -e "$HOME/$f" ] || [ -L "$HOME/$f" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$f")"
        mv "$HOME/$f" "$BACKUP_DIR/$f"
        echo "  백업: ~/$f"
        backed_up=1
    fi
done < <(dot ls-tree -r --name-only HEAD)

info "체크아웃"
dot checkout -f
dot branch --set-upstream-to=origin/main main > /dev/null 2>&1 || true

# SSH 권한 정리
[ -d "$HOME/.ssh" ] && chmod 700 "$HOME/.ssh"
[ -f "$HOME/.ssh/config" ] && chmod 600 "$HOME/.ssh/config"

info "완료"
[ "$backed_up" -eq 1 ] && echo "  기존 파일 백업 위치: $BACKUP_DIR"
cat <<'EOF'
  새 셸을 열거나 `exec $SHELL -l` 로 설정을 적용하세요.
  관리: alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
EOF
