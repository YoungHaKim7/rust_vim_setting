# Dotfiles

https://gitlab.com/dwt1/dotfiles

<br>

# CocConfig(vim)

```
{
  // rust-analyzer setting~
  "diagnostic.enable": true,
  "diagnostic.virtualText": true,
  "diagnostic.joinMessageLines": true,
  "diagnostic.checkCurrentLine": true,
  "diagnostic.messageTarget": "float",
  "diagnostic.level": "information",
  "suggest.autoTrigger": "none",
  "signature.enable": true,
  "coc.preferences.snippets.enable": true,
  "rust-analyzer.diagnostics.enable": true, 
  "rust-analyzer.inlayHints.enable": true,
  "rust-analyzer.inlayHints.chainingHints": true,
  "rust-analyzer.inlyHints.parameterHints": true,
  "rust-analyzer.cargo.loadOutDirsFromCheck": true,
  "rust-analyzer.procMacro.enable": true,

  "languageserver": {
     "csharp-ls": {
          "command": "csharp-ls",
          "filetypes": ["cs"],
          "rootPatterns": ["*.csproj", ".vim/", ".git/", ".hg/"]
        },
    "ada": {
      "settings": {
        "ada": {
          "projectFile": "gnat/vss_text.gpr"
        }
      },
      "command": "<path>/ada_language_server",
      "filetypes": [
        "ads",
        "adb",
        "ada"
      ]
    }
  },
  "coc.preferences.extensionUpdateCheck": "daily"

}
```


# :CocCommand



# CocCommand 다음 FUZZY> rust-analyer.viewHir View Hir 입력

- Rust code

```rust
pub static FOO: () = unsafe {
    let illegal_ptr2int: usize = std::mem::transmute(&());
    let _copy = illegal_ptr2int;
};
fn main() {
    println!("Hello, world!");
    println!();
}

```

<br>

<hr>

- Hir 보기


```

static FOO = unsafe {
    let illegal_ptr2int: usize = std::mem::transmute(
        &(),
    );
    let _copy = illegal_ptr2int;
};

```

# Rust Doc std(standard Library DOC)

https://doc.rust-lang.org/std/

<br>

##  DOCS.RS(rust 기타 crate문서들)

https://docs.rs/

<br>

<hr>

# Learn Rust With Entirely Too Many Linked Lists

https://rust-unofficial.github.io/too-many-lists/index.html

<br>

<hr>

<br>

# Rust Design Patterns

https://rust-unofficial.github.io/patterns/intro.html

<br>

<hr>

# LunarVim InLayHint _____Comment Color

```
// 어두운 빨간색
: hi Comment guifg=#cfe2f3 guibg=#c90076


// 밝은 분홍색 느낌
: hi Comment guifg=#cfe2f3 guibg=#ff439f

```

- color-hex

https://www.color-hex.com/color/ff439f

<br>

## LunarVim Hover 

Control + Space

<br>

```
Shift + K 하면 이상한 문서가 나옴

Control + Space 해야 내가 생각하는 Hover 가 나온다. 

rust-tools.lua 파일 참조 

```

<hr>

-  한글러스트Rust강의_049⭐️Rust개발환경LunarVim세팅하기_LunarVim_macOS_M1_pro #lunarvim #CocInlayHint #rustinlayhint

https://youtu.be/c8FX89jf4To

<br>

<hr>


# Vim Setting (type 빨강색으로 강조하기 칙칙한 검은색 너무 싫다.)

-vim 에서

```
:hi CocInlayHint ctermbg=125

5 밝다
52 어둡다


```

- 내가 원하는 색깔 256 컬러에서 고르자 ㅎㅎ

https://www.ditig.com/256-colors-cheat-sheet

<br>

-  한글러스트Rust강의_048⭐️Rust개발환경Vim세팅하기_Vim_macOS_M1_pro #vim #CocInlayHint #rustinlayhint

https://youtu.be/gIUOkdMjo8o

<br>

<hr>

# vim documentation scroll(Vim key map)

- CTRL-F (PageDown)

- CTRL-D (PageUp)

```
							*CTRL-E*
CTRL-E			Scroll window [count] lines downwards in the buffer.
			Mnemonic: Extra lines.


							*CTRL-D*
CTRL-D			Scroll window Downwards in the buffer.  The number of
			lines comes from the 'scroll' option (default: half a
			screen).  If [count] given, first set 'scroll' option
			to [count].  The cursor is moved the same number of
			lines down in the file (if possible; when lines wrap
			and when hitting the end of the file there may be a
			difference).  When the cursor is on the last line of
			the buffer nothing happens and a beep is produced.
			See also 'startofline' option.
			{difference from vi: Vim scrolls 'scroll' screen
			lines, instead of file lines; makes a difference when
			lines wrap}

<S-Down>	or				*<S-Down>* *<kPageDown>*

<PageDown>	or				*<PageDown>* *CTRL-F*
CTRL-F			Scroll window [count] pages Forwards (downwards) in
			the buffer.  See also 'startofline' option.
			When there is only one window the 'window' option
			might be used.
```

<br>

https://vimdoc.sourceforge.net/htmldoc/scroll.html#scroll-down

<br>

<hr>

# Vim Command

```
:CocCommand

// rust-analyzer 다시 시작
FUZZY > rust-analyzer.reload

// rust-analyzer upgrade
FUZZY > rust-analyzer.upgrade

:CocOpenLog
error log 보기

:CocConfig
VSCode Setting.JSON 과 비슷
```

<br>

# Vim CocInstall (rust-analyzer)

https://github.com/fannheyward/coc-rust-analyzer#highlight-group

```
:CocInstall coc-rust-analyzer


remove rust-analyzer config from coc-settings.json if you've set

NOTE: For Apple Silicon users, you shouldn't use Node.js v15, checkout #975 for more.


// 이렇게 하면 coc-settings.JSON 에 들어간다.
:CocConfig

```

https://rust-analyzer.github.io/manual.html#vimneovim

<br>

# Vim 창 나누기

```
// 창 좌우로 나누기
:vs


// 창 상하로 나누기
:sp


// 가운데 선 아래(Down)으로 이동 (:sp에서 주로 사용)
:ObviousResizeDown

// 가운데 선 위(Up)로 이동 (:sp에서 주로 사용)
:ObviousResizeUp

// 가운데 선 오른쪽(Right)으로 이동(:vs에서 주로 사용)
:ObviousResizeRight

// 가운데 선 왼쪽(Left)으로 이동(:vs에서 주로 사용)
:ObviousResizeLeft
```

- Plug in 설치 없이 사용 가능

```
// Plug In 설치 없이 가능한 명령어
// 위, 아래 크기 조절
:resize +10

// 좌, 우 조절
:vertical resize +10

```

<hr>

<br>

<br>
