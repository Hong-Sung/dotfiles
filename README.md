# Dotfiles

## 1. 개요 (Overview)
GNU Stow를 사용하여 macOS 설정 파일(dotfiles)을 관리합니다.
기존의 Bare Repo 방식에서 Symlink 방식으로 변경되었습니다.

## 2. 설치 및 설정 (Installation)

### 2-1. 저장소 클론
```bash
# 원하는 디렉토리에 클론 (예: ~/work/dotfiles)
git clone git@github.com:Hong-Sung/dotfiles.git ~/work/dotfiles
cd ~/work/dotfiles
```

### 2-2. GNU Stow 설치

**macOS:**
```bash
brew install stow
```

**Ubuntu / Debian:**
```bash
sudo apt update
sudo apt install stow
```

## 3. 적용 (Apply)
원하는 패키지를 홈 디렉토리(`~`)에 심볼릭 링크로 연결합니다.

```bash
# 전체 적용
stow --target=$HOME zsh git vim tmux

# 특정 패키지만 적용 (예: zsh)
stow --target=$HOME zsh
```

## 4. 제거 (Remove)
심볼릭 링크를 제거하고 싶을 때는 `-D` 옵션을 사용합니다.

```bash
stow -D --target=$HOME zsh
```

## 디렉토리 구조
- `zsh/`: .zshrc, .zprofile, .zshenv
- `git/`: .gitconfig
- `vim/`: .vimrc
- `tmux/`: .tmux.conf
- `gemini/`:
    - .gemini/GEMINI.md
    - .gemini/antigravity/global_workflows/
    - .gemini/antigravity/skills/
- `bash/`: .bashrc, .profile
- `shell/`: .aliases, .exports, .functions
