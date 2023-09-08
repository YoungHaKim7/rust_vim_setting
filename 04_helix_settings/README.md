# Helix( A post-modern text editor.)<a href="https://helix-editor.com/"><img align="left" alt="helix" width="20px" src="https://user-images.githubusercontent.com/67513038/214281307-c7bd5adf-eba9-4f13-9247-7700fb1deff9.png" /></a><a href="https://www.rust-lang.org/"><img align="center" alt="rust1" width="26px" src="https://user-images.githubusercontent.com/67513038/213436632-820a1675-98d9-4626-979d-be63c60cdcb7.png" /></a>

# Helix Debugger-Configurations

https://github.com/helix-editor/helix/wiki/Debugger-Configurations#configure-debuggers

This page can provide additional debugger configurations beyond [the ones shipped by default in Helix](https://github.com/helix-editor/helix/blob/master/languages.toml).

# lldb-vscode

## Install

### macOS users

1. Install LLVM: `brew install llvm`
2. Add `$(brew --prefix)/opt/llvm/bin` your PATH, usually in your ~/.bashrc or .zshrc file.
3. Restart your shell

## Configure
### Rust

Helix supports debugging Rust, by default, with [`lldb-vscode`](https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode), which is part of `llvm/lldb`.
However, there is an issue where [string variables are displayed as memory addresses instead of their actual values](https://github.com/helix-editor/helix/issues/7007).

To resolve this, [rust-lldb](https://github.com/rust-lang/rust/blob/master/src/etc/rust-lldb) provides a solution by executing specific lldb commands before loading the program  
(your paths may be different depending on your rust installation):

```sh
$ rust-lldb target/debug/hello_cargo
(lldb) command script import "/opt/homebrew/Cellar/rust/1.71.0/lib/rustlib/etc/lldb_lookup.py"
(lldb) command source -s 0 '/opt/homebrew/Cellar/rust/1.71.0/lib/rustlib/etc/lldb_commands'
Executing commands in '/opt/homebrew/Cellar/rust/1.71.0/lib/rustlib/etc/lldb_commands'.
```

Once these commands are executed, the debugger can display the contents of local string variables:

```lldb
(lldb) b src/main.rs:5
Breakpoint 1: where = hello_cargo`hello_cargo::main::h24135e338b19c0c6 + 212 at main.rs:5:5, address = 0x0000000100003cc0
(lldb) run
Process 62497 launched: '/path/to/hello_cargo/target/debug/hello_cargo' (arm64)
Process 62497 stopped
* thread #1, name = 'main', queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100003cc0 hello_cargo`hello_cargo::main::h24135e338b19c0c6 at main.rs:5:5
   2        let s = "world";
   3        let x = 2;
   4        let b = true;
-> 5        println!("Hello, {} {} {}!", s, x, b);
   6    }
(lldb) frame variable
(&str) s = "world" {
  data_ptr = 0x0000000100039d70 "worldHello,  !\n"
  length = 5
}
(int) x = 2
(bool) b = true
(lldb)
```

Within `lldb-vscode`, we can replicate this functionality by using [initCommands](https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode#launch-configuration-settings).

Save the following python snipped as `/usr/local/etc/lldb_vscode_rustc_primer.py` (create the directory if it doesn't exist yet):

```python
import subprocess
import pathlib
import lldb

# determine the sysroot for the active rust interpreter
rustlib_etc = pathlib.Path(subprocess.getoutput('rustc --print sysroot')) / 'lib' / 'rustlib' / 'etc'
if not rustlib_etc.exists():
    raise RuntimeError('Unable to determine rustc sysroot')

# load lldb_lookup.py and execute lldb_commands with the correct path
lldb.debugger.HandleCommand(f"""command script import "{rustlib_etc / 'lldb_lookup.py'}" """)
lldb.debugger.HandleCommand(f"""command source -s 0 "{rustlib_etc / 'lldb_commands'}" """)
```

This script will take care of finding your active rust installation and execute the lldb setup scripts the same way rust-lldb would.

Then update your `~/.config/helix/languages.toml`:

```toml
[[language]]
name = "rust"

[language.debugger]
name = "lldb-vscode"
transport = "stdio"
command = "lldb-vscode"

[[language.debugger.templates]]
name = "binary"
request = "launch"
completion = [ { name = "binary", completion = "filename" } ]
args = { program = "{0}", initCommands = [ "command script import /usr/local/etc/lldb_vscode_rustc_primer.py" ] }
```

# Codelldb [![GitHub release (latest by date)](https://img.shields.io/github/v/release/vadimcn/vscode-lldb)](https://github.com/vadimcn/vscode-lldb/releases/)
## Install

### Linux (tested in ubuntu)

Access your user folder.
```sh
cd ~
```

Check the architecture of the cpu to later download the correct version of `codelldb`.
```sh
lscpu | grep -oP 'Architecture:\s*\K.+'
```

create a folder named `bin` and access it.
```sh
mkdir bin && cd bin
```

Will download `codelldb` through `curl`. ( `.vsix` can be opened as `.zip` ).
```sh
sudo curl -L "https://github.com/vadimcn/vscode-lldb/releases/download/v1.7.0/codelldb-x86_64-linux.vsix" -o "codelldb-x86_64-linux.zip"
```

Unzip only the necessary folders, in this case `extension/adapter` and `extension/lldb`.
```sh
unzip "codelldb-x86_64-linux.zip" "extension/adapter/*" "extension/lldb/*"
```

Rename the `extension/` folder to `codelldb_adapter/`
```sh
mv extension/ codelldb_adapter
```

Delete the unneeded `codelldb-x86_64-linux.zip` at this time.
```sh
sudo rm "codelldb-x86_64-linux.zip"
```

Create the symlink from `codelldb_adapter/adapter/codelldb` to `/usr/bin/codelldb` and you're done.
```sh
ln -s $(pwd)/codelldb_adapter/adapter/codelldb /usr/bin/codelldb
```

Test: `codelldb -h`

## Configure
### Rust

You can also use [`vscode-lldb`](https://github.com/vadimcn/vscode-lldb)'s [adapter](https://github.com/vadimcn/vscode-lldb/tree/master/adapter) named `codelldb`. (Note, the names can be confusing. `vscode-lldb` is a separate project from the aforementioned `lldb-vscode`.)

```toml
[[language]]
name = "rust"

[language.debugger]
command = "codelldb"
name = "codelldb"
port-arg = "--port {}"
transport = "tcp"

[[language.debugger.templates]]
name = "binary"
request = "launch"
[[language.debugger.templates.completion]]
completion = "filename"
name = "binary"

[language.debugger.templates.args]
program = "{0}"
runInTerminal = true
```

Test with: `debug-start binary target/debug/zellij`, for example.
Status: start/stop debugging works, breakpoints work

## Addendum: For users who can't make any of the above work

To simply install the default debugger that will work out of the box you need to:

1. Install `LLVM`.

The easiest way to do this is to use the pre-compiled binaries from the releases page: https://github.com/llvm/llvm-project/releases, for example, at the time of writing the latest version for Linux is: https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.2/clang+llvm-15.0.2-x86_64-unknown-linux-gnu-rhel86.tar.xz

2. Unpack the entire directory somewhere accessible in your system `$PATH` and create a symbolic link.

If you have `~/bin` in your path then unpack `LLVM` there and make a symlink to the `lldb-vscode` file that lives in the `bin` directory.

![Screenshot from 2022-10-12 19-43-46](https://user-images.githubusercontent.com/12832280/195423210-fea5970c-9453-4a8d-8acc-b0cfd5d626e6.png)

Now when you run the debugger in Helix select `launch debug target` and `binary`, then for example, to debug Rust, `target/debug/` and the name of your executable.

## Addendum 2: For users who installed a debugger successfully but cannot attach to a running process

If on Linux, trying to attach to a running process for debugging and being refused by the adapter due to a message similar to `Operation not permitted`, ensure `ptrace` is not blocking you. This can be done by following this [Microsoft troubleshooting guide](https://github.com/Microsoft/MIEngine/wiki/Troubleshoot-attaching-to-processes-using-GDB).

Summary of steps needed to be done are one of:
1. Ensure `/proc/sys/kernel/yama/ptrace_scope` has a `0` as value, instead of 1
2. If the file is not present or Yama is not used, use `libcap2-bin` to assign ptrace specific permissions to the debug adapter (overriding the command used by Helix, usually set in a `languages.toml` file).

<hr>

# Helix

- Multi 커서 만들기

  - 원하는 단어에서 space - h 누르면 단체로 고치는거 가능해짐_ lsp _rename 같음

  - visual mode 에서 5o 이렇게 하면 멀티 커서 만들어짐 (취소는 ,)
  - v 누르고 멀티라인 지정하고 대문자 S 누르고 원하는 단어 누르면 멀티 커서 만들어짐 I 누르고 앞으로 이동 후 다시 visual mode 만들면 i a 먹음 그리고 단체로 고치기

- 빠르게 오류난 곳을 이동

  - ```[d```   or ```]d```

# Clangd 15 install(

https://github.com/clangd/clangd/releases

# How do I use the debugger with Rust? #4048(유일한 단서.. 성공한 사람 마지막에 중국사람이 성공함)

- https://github.com/helix-editor/helix/discussions/4048

- 유력한 단서 1

https://github.com/helix-editor/helix/wiki/Debugger-Configurations#addendum-for-users-who-cant-make-any-of-the-above-work

https://github.com/helix-editor/helix/discussions/4048

  - 단서 3번째
  
  - https://www.reddit.com/r/HelixEditor/comments/101dnq5/binary_for_debug_adapter_lldbvscode_not_found_in/

  - 단서 4번째

  - https://github.com/vadimcn/codelldb/blob/master/MANUAL.md

  - https://stackoverflow.com/questions/75691155/how-to-install-codelldb-cli-on-apple-silicon
  
  - 단서 4번째
  
  - https://www.reddit.com/r/neovim/comments/ryy7yx/nvim_dap_rust_debugger_lldbvscode_binary_missing/
  
## macOS

https://www.hiroakit.com/archives/1966
  
# inlay hint 빨간색 (어두운 색)

- solarized_dark.toml

```

"ui.virtual.inlay-hint" = { fg = "base01", bg = "#9e2d19", modifiers = ["italic"] }

```

- solarized_dark.toml

```

"attribute" = { fg = "violet" }
"keyword" = { fg = "green" }
"keyword.directive" = { fg = "orange" }
"namespace" = { fg = "violet" }
"operator" = { fg = "green" }
"special" = { fg = "orange" }
"variable.builtin" = { fg = "cyan", modifiers = ["bold"] }
"variable.function" = { fg = "blue" }
"type" = { fg = "yellow" }
"type.builtin" = { fg = "yellow", modifiers = ["bold"] }
"constructor" = { fg = "blue" }
"function" = { fg = "blue" }
"function.macro" = { fg = "magenta" }
"function.builtin" = { fg = "blue", modifiers = ["bold"] }
"function.special" = { fg = "magenta" }
"comment" = { fg = "base01" }
"string" = { fg = "cyan" }
"constant" = { fg = "cyan" }
"constant.builtin" = { fg = "cyan", modifiers = ["bold"] }
"constant.character.escape" = { fg = "red", modifiers = ["bold"] }
"label" = { fg = "green" }
"module" = { fg = "violet" }
"tag" = { fg = "magenta" }

# TODO
"markup.heading" = "blue"
"markup.list" = "red"
"markup.bold" = { fg = "yellow", modifiers = ["bold"] }
"markup.italic" = { fg = "magenta", modifiers = ["italic"] }
"markup.strikethrough" = { modifiers = ["crossed_out"] }
"markup.link.url" = { fg = "yellow", modifiers = ["underlined"] }
"markup.link.text" = "red"
"markup.quote" = "cyan"
"markup.raw" = "green"

"diff.plus" = { fg = "green" }
"diff.delta" = { fg = "orange" }
"diff.minus" = { fg = "red" }

# 背景
"ui.background" = { bg = "base03" }

"ui.virtual.whitespace" = { fg = "base01" }
"ui.virtual.inlay-hint" = { fg = "base01", bg = "#9e2d19", modifiers = ["italic"] }

# 行号栏
"ui.linenr" = { fg = "base0", bg = "base02" }
# 当前行号栏
"ui.linenr.selected" = { fg = "blue", modifiers = ["bold"] }
#cursorline
"ui.cursorline" = { bg = "base03" }

# 状态栏
"ui.statusline" = { fg = "base03", bg = "base0" }
"ui.statusline.normal" = { bg = "blue" }
"ui.statusline.insert" = { bg = "green" }
"ui.statusline.select" = { bg = "yellow" }

# 非活动状态栏
"ui.statusline.inactive" = { fg = "base1", bg = "base01" }

# 补全窗口, preview窗口
"ui.popup" = { bg = "base02" }
# 影响 补全选中 cmd弹出信息选中
"ui.menu.selected" = { fg = "base02", bg = "base2"}
"ui.menu" = { fg = "base0", bg = "base02" }
# ??
"ui.window" = { fg = "base3" }
# 命令行 补全的帮助信息
"ui.help" = { modifiers = ["reversed"] }

# 快捷键窗口 
"ui.popup.info" = {fg = "base02", bg = "base1", modifiers = ["bold"]}
# 快捷键字体
"ui.text.info" = {fg = "base02", modifiers = ["bold"]}

# 普通ui的字体样式
"ui.text" = { fg = "base1" }
# 影响 picker列表选中, 快捷键帮助窗口文本
"ui.text.focus" = { fg = "blue", modifiers = ["bold"]}
# file picker中， 预览的当前选中项
"ui.highlight" = { fg = "red", modifiers = ["bold", "italic", "underlined"] }

# 主光标/selectio
"ui.cursor.primary" = { fg = "base03", bg = "base1" }
"ui.cursor.select" = { fg = "base02", bg = "cyan" }
"ui.cursorline.primary" = { bg = "base02" }
"ui.cursorline.secondary" = { bg = "base025" }

"ui.selection" = { bg = "base0175" }
"ui.selection.primary" = { bg = "base015" }

"ui.virtual.indent-guide" = { fg = "base02" }
"ui.virtual.ruler" = { fg = "red" }

# normal模式的光标
"ui.cursor" = {fg = "base02", bg = "cyan"}
"ui.cursor.insert" = {fg = "base03", bg = "base3"}
# 当前光标匹配的标点符号
"ui.cursor.match" = { fg = "base03", bg = "base00" }

"warning" =  { fg = "orange", modifiers= ["bold", "underlined"] }
"error" = { fg = "red", modifiers= ["bold", "underlined"] }
"info" = { fg = "blue", modifiers= ["bold", "underlined"] }
"hint" = { fg = "base01", modifiers= ["bold", "underlined"] }

"diagnostic.warning" = { underline = { style = "curl", color = "orange" } }
"diagnostic.error" = { underline = { style = "curl", color = "red" } }
"diagnostic.info" = { underline = { style = "curl", color = "blue" } }
"diagnostic.hint" = { underline = { style = "curl", color = "base01" } }

[palette]
# 深色 越来越深
base03   = "#002b36"
base025  = "#03303b"
base02   = "#073642"
base0175 = "#16404b"
base015  = "#2c4f59"
base01   = "#586e75"
base00   = "#657b83"
base0    = "#839496"
base1    = "#93a1a1"
base2    = "#eee8d5"
base3    = "#fdf6e3"

# 浅色 越來越浅
yellow  = "#b58900"
orange  = "#cb4b16"
red     = "#dc322f"
magenta = "#d33682"
violet  = "#6c71c4"
blue    = "#268bd2"
cyan    = "#2aa198"
green   = "#859900"

```





# theme 파일 들어가서 손 봐줘야함(%HOME/.config/helix/runtime/themes/ 

  - ./config/helix/config.toml    (여기서 보통 수정많이 하는데 inlay hint는 테마 들어가서 수정)

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
~~~~~~~~~~~~Helix~~~~~~~~~~~~~
~~~ Q 녹화시작
~~~ Q 녹화 종료

~~~ q 녹화한 매크로 사용하기
normal mode에서
Q
대문자 Q start

종료 Q
대문자 Q 한번 더 누른다.


사용할때
소문자 q

q만 쓰는듯 하다. 
일단 q만 쓰도록 하자

Helix는 q(소문자 q) 가 불러오기

저장하기는 대문자 Q(대문자 Q) 시작 Q 종료 Q
~~~~~~~~~~~~Helix~~~~~~~~~~~~~


~~~~~~~빔vim에서 사용법ㅡ~~~~~~~
녹화 시작 q(normal mode) 누르면 녹화 시작 
저장하고 싶은 레지스터에 누른다.(a~z) 숫자도 되는듯 싶다.

불러오기 @
귀찮을땐 @@ 2번 누르면 전에 사용한거 그대로 사용 가능 개꿀!!!
vim @a
저장된 레지스터Registers 불러오는데 @ a 이런식

:registers  지금 저장된 레지스터 보기
~~~~~~~~~~~~~~~
```

# 내가 주로 쓰는 테마 2개

- config.toml

```
theme = "fleet_dark"
# theme = "solarized_dark"
```

# helix 문서 밑으로 내리는 방법

- The popup of the documentation does not scroll correctly, it is not proportional when scrolling down and up, for example to scroll to the end ( Ctrl + d ) x 3, and to scroll back up ( Ctrl + u ) x 6.


<hr>

# helix 23.03 ver.

https://helix-editor.com/news/release-23-03-highlights/

<hr>

# Helix (ver23.03) tutorial

- Helix( A post-modern text editor.)<a href="https://helix-editor.com/"><img align="left" alt="helix" width="20px" src="https://user-images.githubusercontent.com/67513038/214281307-c7bd5adf-eba9-4f13-9247-7700fb1deff9.png" /></a><a href="https://www.rust-lang.org/"><img align="center" alt="rust1" width="26px" src="https://user-images.githubusercontent.com/67513038/213436632-820a1675-98d9-4626-979d-be63c60cdcb7.png" /></a>

- https://github.com/helix-editor/helix

- https://helix-editor.com/

- Helix Tutorial

<table border="1">
    <tr>
    <td colspan="2" align="center">Rust (Helix Text editor)<br><a href="https://github.com/helix-editor/helix">Helix Text editor</td>
    </tr>
    <tr align="center">
        <td>Date</td>
        <td>Title & Link</td>
    </tr>
    <tr align="center">
        <td>23-4-09(sun.)</td>
        <td><a href="https://youtu.be/uwu0vv3em3c">한글Rust_071⭐️Rust Backend_WebSever_helix tutorial ver23.03 #helix #rustlang</td>
    </tr>
</table>

# Helix Editor Tutorial(220917)

한글러스트Rust강의\_041⭐️Rust로 만든 에디터Helix기초\_helix tutorial #rustlang #helix

- https://youtu.be/cZfF1XRoIC8

https://github.com/YoungHaKim7/YouTubeContents_GlobalYoung

<br>

# Helix Editor

-Helix-Vim Key Setting

[https://github.com/LGUG2Z/helix-vim](https://github.com/LGUG2Z/helix-vim)

<br>

<hr>

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

<p>
  <a href="https://docs.helix-editor.com/usage.html"><img align="left" alt="helix" width="512px" src="https://blog.kakaocdn.net/dn/bWzy7G/btrVqgTUGVu/fajOnSkVgcFSNreQhGkVl0/img.gif"></a>
</p>


```
// 추가
ms - Add surround characters


// 바꾸기 교체
mr - Replace surround characters


// 지우기  ""이런거
md - Delete surround characters
```

https://docs.helix-editor.com/usage.html

# helix 세팅할 때 주의 할점 Q&A

https://github.com/helix-editor/helix/wiki/FAQ


<br>

<hr>

<hr>

# TypeScript 세팅

https://ar.al/2022/11/14/installing-helix-editor-language-servers/#code

```
#!/usr/bin/env bash

BINARY_HOME="${HOME}/.local/bin"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

echo "Installing Language Servers for Helix Editor:"

# Work in a throwaway temporary directory so as not to pollute the file system.
temporaryDirectory="/tmp/helix-editor-language-server-installer"
mkdir -p "${temporaryDirectory}"
pushd "${temporaryDirectory}"

# Bash
echo "  • Bash (bash-language-server)"
npm i -g bash-language-server

# HTML, JSON, JSON schema
echo "  • HTML, JSON, and JSON schema (vscode-langservers-extracted)"
npm i -g vscode-langservers-extracted

# JavaScript (via TypeScript)
echo "  • JavaScript (typescript, typescript-language-server)"
npm install -g typescript typescript-language-server

# Markdown (via ltex-ls. Note: this has excellent features like
# spelling and grammar check but is a ~269MB download).
echo "  • Markdown (ltex-ls)"
ltexLsVersion=15.2.0
ltexLsBinaryPath="${BINARY_HOME}/ltex-ls"
ltexLsBaseFileName="ltex-ls-${ltexLsVersion}"
ltexLsFileNameWithPlatform="${ltexLsBaseFileName}-linux-x64"
ltexLsAppDirectory="${DATA_HOME}/${ltexLsBaseFileName}"
rm "${ltexLsBinaryPath}"
rm -rf "${ltexLsAppDirectory}"
wget "https://github.com/valentjn/ltex-ls/releases/download/${ltexLsVersion}/${ltexLsFileNameWithPlatform}.tar.gz"
gunzip "${ltexLsFileNameWithPlatform}.tar.gz"
tar xf "${ltexLsFileNameWithPlatform}.tar"
mv "${ltexLsBaseFileName}" "${DATA_HOME}"
ln -s "${ltexLsAppDirectory}/bin/ltex-ls" "${ltexLsBinaryPath}" 

# TOML
cargo install taplo-cli --locked --features lsp

# Clean up.
popd
rm -rf "${temporaryDirectory}"

echo "Done."
```



# Java setting(jdtls)

https://github.com/helix-editor/helix/issues/2510

```
[[language]]
name = "java"
scope = "source.java"
injection-regex = "java"
file-types = ["java"]
roots = ["pom.xml"]
+ language-server = { command = "jdtls" }
indent = { tab-width = 4, unit = "    " }
```

## Eclipse JDT Language Server

https://github.com/eclipse/eclipse.jdt.ls

Installation instructions can be found on the [projects README](https://github.com/eclipse/eclipse.jdt.ls)
On MacOS installation can also be done via `brew install jdtls`

## jdtls & etc

https://github.com/eclipse/eclipse.jdt.ls
