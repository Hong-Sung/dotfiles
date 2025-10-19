
## 1단계: 베어 저장소 복제 (Clone)

GitHub에 있는 원격 저장소 내용을 $HOME 디렉터리에 .dotfiles라는 이름의 베어 저장소로 복제합니다.

```
git clone --bare git@github.com:Hong-Sung/dotfiles.git $HOME/.dotfiles
```

## 2단계: 별칭(alias) 설정

새로운 시스템에는 아직 dotfiles 별칭이 없으므로, 일시적으로 이 셸에서 사용할 별칭을 정의합니다.

```
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

## 3단계: 파일 체크아웃

`dotfiles` 별칭을 사용해 원격 저장소의 파일을 $HOME 디렉터리로 체크아웃합니다.

만약 홈 디렉터리에 기존 파일이 있고 덮어쓰고 싶다면 -f 옵션을 추가합니다


```
dotfiles checkout [-f]
```

## 4단계: untracked files 숨기기 (옵션)

dotfiles status를 실행했을 때 홈 디렉터리의 모든 파일이 보이지 않도록 untracked files를 숨깁니다.

```
dotfiles config --local status.showUntrackedFiles no
```
