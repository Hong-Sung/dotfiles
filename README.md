# dotfiles

Bare git repo 방식으로 관리하는 dotfiles입니다.

## 설치 (새 시스템)

```bash
curl -fsSL https://raw.githubusercontent.com/Hong-Sung/dotfiles/main/install.sh | bash
```

`install.sh`가 하는 일:

- `~/.dotfiles`에 bare repo 클론 (HTTPS라 SSH 키 없이도 동작)
- 겹치는 기존 파일은 `~/.dotfiles-backup/<날짜>/`로 이동 후 체크아웃
- `README.md`, `install.sh`는 sparse checkout으로 `$HOME`에 풀지 않음
- `status.showUntrackedFiles no`, `pull.rebase true` 설정
- 이미 설치돼 있으면 `pull`만 수행

<details>
<summary>수동 설치</summary>

```bash
git clone --bare https://github.com/Hong-Sung/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles checkout   # 충돌 시 기존 파일을 옮긴 뒤 재시도
dotfiles config --local status.showUntrackedFiles no
dotfiles config pull.rebase true
```

</details>

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
