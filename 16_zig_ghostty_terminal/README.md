# 👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.
- https://github.com/ghostty-org/ghostty

# Ghostty doc
- https://ghostty.org/docs

- Teminal API
  - https://ghostty.org/docs/vt/csi/su
  - https://ghostty.org/docs/vt/reference

- Cursor Horizontal Tabulation (CHT)
  - https://ghostty.org/docs/vt/csi/cht

|0x1B|0x5B|____|0x49|
|-|-|-|-|
|ESC|[|n|I|

- CHT V-1: Right Beyond Last Column

```c
printf "\033[?5W" # reset tab stops
printf "\033[100I" # assuming the test terminal has less than 800 columns
printf "A"
```

```bash
|_________A|
```

# config(Ghostty)
- https://ghostty.org/docs/config.
  - config 설명하는 영상[How I configure Ghostty Terminal Adib Hanna](https://youtu.be/jWuQxU4bDeU?si=JjIUOEogMM_1UYmf)
  - sample
    - https://gist.github.com/adibhanna/c552c452fb244b3b721e3c2432e85cde

# theme테마 바꾸기

- https://iterm2colorschemes.com/
  - https://github.com/mbadolato/iTerm2-Color-Schemes
- 폴더 확인해보자
  - https://github.com/ghostty-org/ghostty/discussions/8861

```
./config/ghostty/themes
 "/usr/share/ghostty/themes/rose-pine"
```

# 2025년 터미널 에뮬레이터 현황: 방랑하는 챔피언들
- 터미널의 본질적 한계였던 유니코드 문자 폭 문제를 정면으로 다룬 2025년 평가에서, 새로 등장한 Zig 기반 Ghostty가 정확도 100점으로 1위를 차지했습니다. Kitty 역시 자체 텍스트 셀 분할 알고리즘을 공개하며 표준화 논의에 불을 붙였고, 두 프로젝트 모두 Variation Selector 15까지 완벽히 처리해 사실상 차세대 터미널의 기준을 제시합니다. Ghostty가 Windows를 지원안하는게 참 아쉽네요. 물론 지원관련해서 작업중이라는 깃헙이슈는 2023년부터 있긴 한데, 아직 구현은 요원합니다.
  - https://news.hada.io/topic?id=24130&utm_source=weekly&utm_medium=email&utm_campaign=202545

# Ubuntu Install
- https://github.com/mkasberg/ghostty-ubuntu

# Bug & Fix
- Scroll은 아직 안됨(251113)
  - https://github.com/ghostty-org/ghostty/issues/111
  - macOS에서만 지원중?(251113) https://github.com/ghostty-org/ghostty/pull/9232
