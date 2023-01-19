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