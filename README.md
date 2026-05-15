# dotfiles

Bare git repo 방식으로 관리하는 dotfiles입니다.

## 사전 준비

- `git` 설치
- GitHub SSH 키 등록 (`~/.ssh/config` 및 `ssh-add` 완료 상태)

## 설치 (새 시스템)

```bash
# 1. bare repo 클론
git clone --bare git@github.com:Hong-Sung/dotfiles.git $HOME/.dotfiles

# 2. alias 설정
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 3. 파일 체크아웃
dotfiles checkout
```

> **체크아웃 실패 시** (기존 파일과 충돌하는 경우):
> ```bash
> # 기존 파일 백업 후 재시도
> mkdir -p ~/.dotfiles-backup
> dotfiles checkout 2>&1 | grep "^\s" | awk '{print $1}' | xargs -I{} mv $HOME/{} ~/.dotfiles-backup/{}
> dotfiles checkout
> ```

```bash
# 4. untracked files 숨기기
dotfiles config --local status.showUntrackedFiles no

# 5. pull 전략 설정
dotfiles config pull.rebase true
```

## 사용법

```bash
dotfiles status
dotfiles add ~/.zshrc
dotfiles commit -m "update zshrc"
dotfiles push
dotfiles pull
```

## 구조

```
~/.dotfiles/                  # bare git 저장소
~/.zshrc                      # zsh 설정
~/.zshenv                     # zsh 환경변수 (모든 세션)
~/.zprofile                   # zsh PATH (로그인 셸)
~/.bashrc                     # bash 설정
~/.profile                    # bash PATH (로그인 셸)
~/.gitconfig                  # git 설정
~/.vimrc                      # vim 설정
~/.tmux.conf                  # tmux 설정
~/.ssh/config                 # SSH 설정
~/.config/shell/aliases       # 공통 alias (bash/zsh 공유)
~/.config/shell/exports       # 공통 환경변수
~/.config/shell/functions     # 공통 함수
~/.config/ghostty/config      # Ghostty 터미널 설정
~/.config/lazygit/config.yml  # lazygit 설정
~/.gemini/GEMINI.md           # Gemini 설정
```

## 주요 alias

| alias | 설명 |
|-------|------|
| `vs` | .zshrc / .bashrc 편집 |
| `ve` | .zshenv / .profile 편집 |
| `va` | aliases 편집 |
| `vf` | functions 편집 |
| `vexp` | exports 편집 |
| `vgit` | .gitconfig 편집 |
| `vssh` | .ssh/config 편집 |
| `vtmux` | .tmux.conf 편집 |
| `vvim` | .vimrc 편집 |
| `vghostty` | Ghostty 설정 편집 |
| `dotfiles` | dotfiles git 명령 |

## macOS 전용 설정

`~/.ssh/config` 내 `Match exec "sh -c 'test $(uname) = Darwin'"` 블록에서
Keychain, IdentityFile 등 macOS 전용 SSH 설정을 관리합니다.
