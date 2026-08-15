# link
- [키 변경 및 세팅 다시_키 추가++ keybinds](#keybinds)

<hr />

# default shell setting

```
~/.config/ghostty/config:
command = /usr/local/bin/fish --login --interactive
```

# working-directory

```
ghostty --working-directory=/path/to/folder
```

# ubuntu Install
- https://github.com/mkasberg/ghostty-ubuntu

# Fix & bug 해결
- [창 나눴는데 내 프로젝트 폴더가 안 열리고 root폴더가 열릴때 (리눅스OS bug)](https://github.com/ghostty-org/ghostty/issues/1392)

- test예정(LinuxOS적용되는지 확인)

```
window-inherit-working-directory = false
tab-inherit-working-directory = true
split-inherit-working-directory = true
```

- https://github.com/ghostty-org/ghostty/pull/9158

# 👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.[|🔝|](#link)
- https://github.com/ghostty-org/ghostty

# Ghostty doc[|🔝|](#link)
- https://ghostty.org/docs

# config(Ghostty)[|🔝|](#link)
- https://ghostty.org/docs/config.
  - config 설명하는 영상[How I configure Ghostty Terminal Adib Hanna](https://youtu.be/jWuQxU4bDeU?si=JjIUOEogMM_1UYmf)
  - sample
    - https://gist.github.com/adibhanna/c552c452fb244b3b721e3c2432e85cde

# theme테마 바꾸기[|🔝|](#link)

- https://iterm2colorschemes.com/
  - https://github.com/mbadolato/iTerm2-Color-Schemes
- 폴더 확인해보자
  - https://github.com/ghostty-org/ghostty/discussions/8861

```
./config/ghostty/themes
 "/usr/share/ghostty/themes/rose-pine"
```

# 2025년 터미널 에뮬레이터 현황: 방랑하는 챔피언들[|🔝|](#link)
- 터미널의 본질적 한계였던 유니코드 문자 폭 문제를 정면으로 다룬 2025년 평가에서, 새로 등장한 Zig 기반 Ghostty가 정확도 100점으로 1위를 차지했습니다. Kitty 역시 자체 텍스트 셀 분할 알고리즘을 공개하며 표준화 논의에 불을 붙였고, 두 프로젝트 모두 Variation Selector 15까지 완벽히 처리해 사실상 차세대 터미널의 기준을 제시합니다. Ghostty가 Windows를 지원안하는게 참 아쉽네요. 물론 지원관련해서 작업중이라는 깃헙이슈는 2023년부터 있긴 한데, 아직 구현은 요원합니다.
  - https://news.hada.io/topic?id=24130&utm_source=weekly&utm_medium=email&utm_campaign=202545

# Ubuntu Install[|🔝|](#link)
- https://github.com/mkasberg/ghostty-ubuntu

# Bug & Fix[|🔝|](#link)
- Scroll은 아직 안됨(251113)
  - https://github.com/ghostty-org/ghostty/issues/111
  - macOS에서만 지원중?(251113) https://github.com/ghostty-org/ghostty/pull/9232

# keybinds[|🔝|](#link)

- [창 전환 세팅해 보기](https://github.com/ghostty-org/ghostty/discussions/3187)
  - [zig bind코드 ](https://github.com/ghostty-org/ghostty/blob/c8950d376ab3be13fbd9a19317163075f4feddbc/src/input/Binding.zig#L1427)


```
# vim키랑 겹쳐서 선호 하지는 않음 구린세팅이지만 혹시나
keybind = ctrl+z=close_surface
keybind = ctrl+d=new_split:right


## TMUX
# :vs
keybind = alt+\=new_split:right
# :sp
keybind = alt+-=new_split:down


# Navigation TMUX
keybind = ctrl+shift+h=goto_split:left
keybind = ctrl+shift+j=goto_split:bottom
keybind = ctrl+shift+k=goto_split:top
keybind = ctrl+shift+l=goto_split:right


# Resize split
keybind = alt+shift+h=resize_split:left,20
keybind = alt+shift+j=resize_split:down,20
keybind = alt+shift+k=resize_split:up,10
keybind = alt+shift+l=resize_split:right,10
keybind = alt+shift+plus=equalize_splits

```

- [TMUX Style창 나누기](https://www.reddit.com/r/Ghostty/comments/1izc7vq/split_screen_configurations/)

- Teminal API
  - https://ghostty.org/docs/vt/csi/su
  - https://ghostty.org/docs/vt/reference

- Cursor Horizontal Tabulation (CHT)
  - https://ghostty.org/docs/vt/csi/cht

|0x1B|0x5B|____|0x49|
|-|-|-|-|
|ESC|[|n|I|

- CHT V-1: Right Beyond Last Column

```bash
printf "\033[?5W" # reset tab stops
printf "\033[100I" # assuming the test terminal has less than 800 columns
printf "A"
```

```bash
|_________A|
```
