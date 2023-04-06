# theme 파일 들어가서 손 봐줘야함(./config/helix/runtime/themes/ )

- runtime/themes/base16_transparent.toml

  - config.toml

  ```
  theme = "base16_transparent"
  ```

- runtime/themes/fleet_dark.toml

```
# ui specific
"ui.background" = { bg = "Gray 10" } # .separator
"ui.statusline" = { fg = "Gray 120", bg = "Gray 10" } # .inactive / .normal / .insert / .select
# "ui.statusline.normal" = { fg = "Gray 120", bg = "darker"}
"ui.statusline.insert" = { fg = "Gray 20", bg = "Blue 90" }
"ui.statusline.select" = { fg = "Gray 20", bg = "Yellow 60" }

"ui.cursor" = { modifiers = ["reversed"] } # .insert / .select / .match / .primary
"ui.cursor.match" = { bg = "Blue 30" } # .insert / .select / .match / .primary
	@@ -92,7 +92,7 @@
"ui.text.focus" = { fg = "White", bg = "Blue 40" }

"ui.virtual" = "Gray 80" # .whitespace
"ui.virtual.inlay-hint" = { fg = "Gray 70" }
# "ui.virtual.ruler" = { bg = "darker"}
```

https://github.com/helix-editor/helix/pull/6324/commits/b9a4d2e311b7e4ff26664e02f8dcd3bca44dc222


- themes/darcula-solid.toml

```
# Original source and more info: https://github.com/jesusmgg/darcula-solid-helix

inherits = "darcula"

"ui.background.separator" = { bg = "grey01" }
"ui.menu.scroll" = { fg = "grey02", bg = "grey00" }
"ui.popup" = { fg = "grey03", bg = "grey02" }
"ui.window" = { bg = "grey00" }
"ui.selection" = { bg = "blue" }
"ui.cursorline.secondary" = { bg = "grey03" }

[palette]
grey00 = "#101010"
grey01 = "#1f1f1f"
grey02 = "#323232"
grey03 = "#555555"
grey04 = "#a8a8a8"

blue = "#104158"
```

# lsp.display-inlay-hints(helix ver. 23.03)

```
:set lsp.display-inlay-hints true


//off
:set lsp.display-inlay-hints false
```

- config.toml(inlay-hint 자동으로 활성화 시키기)

```
[editor.lsp]
display-messages = true
display-inlay-hints = true
```

<hr>

# Hexli Macro 사용법

```
normal mode에서
Q
대문자 Q start

종료 Q
대문자 Q 한번 더 누른다.


사용할때
소문자 q

q만 쓰는듯 하다. 
일단 q만 쓰도록 하자

vim @a
저장된 레지지터 불러오는데 @ a 이런식

Helix는 q(소문자 q) 가 불러오기

저장하기는 대문자 Q(대문자 Q) 시작 Q 종료 Q
```

# helix 문서 밑으로 내리는 방법

- The popup of the documentation does not scroll correctly, it is not proportional when scrolling down and up, for example to scroll to the end ( Ctrl + d ) x 3, and to scroll back up ( Ctrl + u ) x 6.


<hr>

# helix 23.03 ver.

https://helix-editor.com/news/release-23-03-highlights/

# Helix Editor Tutorial(220917)

한글러스트Rust강의\_041⭐️Rust로 만든 에디터Helix기초\_helix tutorial #rustlang #helix

- https://youtu.be/cZfF1XRoIC8

<br>

# Helix Editor

-Helix-Vim Key Setting

[https://github.com/LGUG2Z/helix-vim](https://github.com/LGUG2Z/helix-vim)

<br>

# Docs.helix-editor.com

- Original Keymap
  [https://docs.helix-editor.com/keymap.html](https://docs.helix-editor.com/keymap.html)

<br>

# Helix 최신 뉴스로 내가 필요한 기능 체크하자

- Helix 최신 뉴스 체크하기

https://helix-editor.com/news

https://helix-editor.com/news/release-22-08-highlights/

<hr>

<br>

# Helix Q&A

https://github.com/helix-editor/helix/wiki/FAQ

<br>

# Helix LSP Debug

https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode#Installation-Visual-Studio-Code

<br>

# Helix Binary for debug adapter(Rust)

/Users/users/.cargo/bin/rust-lldb

<br>

# Helix 주로 쓰는 command

```
:set cursorline true   " 한줄 내가 코드 쓰는거 줄 강조 됨
:set color-modes true      "insert, normal, sellect mode  색깔로 이쁘게



:config-open  " 설정파일 열기
:config-reload " 설정파일 reload 바로 적용하기

:o     " 파일 열기  강제로 열어서 파일 만들기 가능
:w!     " 강제 저장
:sh    " cargo run 같은거 가능
:sh cargo run   " shell 에서 명령어 실행
:vs   " 창 좌우로 나누기
:hs   " 창 상하로 나누기
:wq   " 저장하고 나가기
:change-current-directory   " 내가 작업하는 코드 디렉토리 바꿈


// Normal mode 에서 주로 쓰는거
miw : 커서위 단어 선택하기
* / 하면 내가 선택한 단어 검색 가능
n  다음     N  뒤로 가기

f 누르면 오른쪽으로 검색
t 누르면  단어 바로 앞에서 멈춤

x 커서 위 하나 삭제
s 커서 위 하나 삭제하면서 insert mode 진입
S 노멀모드에서 하면 내가 위치한 줄 전체 지우고 맨 처음으로 이동

----------------
surround " 단어 "" 이걸로 감싸기
v 비줄어 모드 바꾸고
miw 단어 선택
S
" 누르면 단어 "" 이걸로 감싸짐


surround "단어" 이렇게 된거 ""이것만 삭제하기
normal 모드에서
ds
" 누르면
"단어" 가 단어
이렇게 바뀜
편함 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ
```

# Helix text Editor❤️ Surround사용법(ms, mr, md) (기본 내장됨)

<td><a href="https://docs.helix-editor.com/usage.html"><img align="left" alt="helix" width="512px" src="https://blog.kakaocdn.net/dn/bWzy7G/btrVqgTUGVu/fajOnSkVgcFSNreQhGkVl0/img.gif"></a>

<br>

```
// 추가
ms - Add surround characters


// 바꾸기 교체
mr - Replace surround characters


// 지우기  ""이런거
md - Delete surround characters
```

https://docs.helix-editor.com/usage.html
