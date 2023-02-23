# 🎓 All things Vim!

  - https://github.com/mhinz/vim-galore

# NeoVim docs

https://neovim.io/doc/user/map.html

<br>

https://neovim.io/doc/user/index.html

<br>

<hr>

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

# Vim 자료 모음

https://economiceco.tistory.com/12352


<br>

<hr>

<br>

# Vim buffer & tabnew

- buffer 관련

```
파일 여러개 열었을때 버퍼보기
:buffers
3
5

:b3
3버퍼로 이동

:b5 
5버퍼로 이동

:bn
next 다음 버퍼로 이동

:bp
previous 전 버퍼로 이동

```

- tabnew 관련

```
tabe 하고 그냥 파일 열면 파일 열림

:[count]tabe[dit]
 

 

tab간 이동 tabn1     :tabn2 이렇게 쓰면 된다.

:tabn[ext] {count
 

tab 닫기

:tabc


// 새탭 열기
:tabnew


// 첫번째 탭으로 이동
:tabfirst


// 마지막 탭으로 이동
:tablast


// 3번째 탭으로 이동  tabn 이런 패턴
:tabn3


// 탭 오른쪽 이동
<C-w>gt


// 탭 왼쪽 이동
<C-w>gT



```

https://vimhelp.org/tabpage.txt.html

<br>

<hr>

# Vim command & key

```
라인 넘버 나오게 하기
:set number

:set nu!
동일함



-- 내가 좋아하는 기능
라인 넘버 상대번호로 만들기
:set relativenumber
:set rnu



-- 최근 쓰고 있는 하이브리드
:set number rnu


:%X
Where X is a command, for example:

:%d -> delete every line
:%y -> yank every line
:%normal! >> -> indent every line
You have also the global command :g which, with the search pattern ^, can do the same thing:

:g/^/d -> delete every line
:g/^/y -> yank every line
:g/^/normal! >> -> indent every line
If what you want is selecting the text, then ggVG is fine, but keep in mind these method, in the case you already know what is the next step. Note that it won't leave the cursor in visual mode.

See: :h :% and :h :g for reference.


내가 자주 쓰는 최고의 단축키 ㅎㅎㅎ 그냥 통으로 한줄 똑같은거 찾기 (Insert모드에서 쓰면 됨)
Ctrl-x-l Complete line

(Insert 모드에서)
Ctrl-t Insert모드에서 탭 적용됨. 개꿀 👍

gc는 y/n로 바꿀 꺼 물어봄.
:%s/바꿀 단어(전)/바꿀 단어(후)/gc


라인 이동
15gg
15G
똑같음 (15줄로 이동)


// 여러줄 이쁘게 알파벳으로 정렬됨 최고
// 내가 원하는 줄 블럭 씌우고
:누르면
:'<,'> 이렇게 나오는데

뒤에 그대로 sort
:'<,'>sort


// 여러줄 이쁘게 알파벳으로 정렬됨 최고



```

## Vim normal 활용법
```
Visual mode로 내가 원하는 라인 선택해주고

// 내가 원하는 줄 블럭 씌우고
:누르면
:'<,'> 이렇게 나오는데

뒤에 그대로 normal
:'<,'>normal A;


블럭 씌우 코드 줄 적용
맨 뒤에 ; 추가됨


```

## // normal 활용법
57초

https://youtu.be/ZeMcpSR6fXI



## Marks활용법

```
// 마크 mark 설정하는 방법 
// 키보드 26가지를 다 저장할 수 있다. 레지스터 쓰는거라 비슷함

// 현재 커서 위치를 마크 a 라고 저장함.
ma    


// a 로 저장한 마크로 이동하기
'a




:marks a

// a 저장한 마크로 빠르게 이동한다.

// 스타1 부대 지정 같이 많이 쓰는 장소를 마크로 저장해서 빠르게 이동하자




:marks 

// 하면 내가 저장한 마크를 다 볼 수 있다. Good

m 으로 마크 등록
' 불러오기
```

관련 링크

https://youtu.be/o4x4jUcHJwk


# Macro 활용법
```
내가 만든 매크로 @x 골맹이 x에 저장된 매크로 문서 전체에 실행하기
:%norm @x
Run macro @x on all lines
```

vim의 꽃은 역시 매크로macro❤️
빔Vim Macro 매크로_활용법 I love❤️vim~~👍~반복 작업은 Bye Bye #vim #macro

https://youtu.be/VRqpMXF32qk

<br>


## spell checker!!

Example#
To set the word list that vim will use for spell checking set the spelllang option. For example

```
:set spelllang=en        # set to English, usually this is the default
:set spelllang=en_us     # set to U.S. English 
:set spelllang=en_uk     # set to U.K. English spellings
:set spelllang=es        # set to Spanish
```

If you want to set the spelllang and turn on spell checking in one command, you can do:

```
:setlocal spell spelllang=en
```

다른 :set 잘 정리됨 (linux스타일)

http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.html


## Normal mode key

```
Normal

ggVG
selects all content.


gg
moves to first line.

V
starts visual mode.

G
jumps to last line thereby selecting from first to last line

```

# {} () 괄호 안에 것만 지우기


## dit


t 는 tag의 약자



```
dit
태그 안에 글씨 다 지워짐 HTML 할 꿀팁


<p>HTML test sentence </p>

test만 지우고 싶으면

비쥬얼 모드 유지
di{

insert모드 바로 들어가기
ci{ 


("{test}")

```

관련 영상

https://youtu.be/cY0JxzENBJg

# surround vim

```
surround.vim
Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

It's easiest to explain with examples. Press cs"' inside

"Hello world!"
to change it to

'Hello world!'
Now press cs'<q> to change it to

<q>Hello world!</q>
To go full circle, press cst" to get

"Hello world!"
To remove the delimiters entirely, press ds".

Hello world!
Now with the cursor on "Hello", press ysiw] (iw is a text object).

[Hello] world!
Let's make that braces and add some space (use } instead of { for no space): cs]{

{ Hello } world!
Now wrap the entire line in parentheses with yssb or yss).

({ Hello } world!)
Revert to the original text: ds{ds)

Hello world!
Emphasize hello: ysiw<em>

<em>Hello</em> world!
Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.

<p class="important">
  <em>Hello</em> world!
</p>
This plugin is very powerful for HTML and XML editing, a niche which currently seems underfilled in Vim land. (As opposed to HTML/XML inserting, for which many plugins are available). Adding, changing, and removing pairs of tags simultaneously is a breeze.
```

https://github.com/tpope/vim-surround


## WindowsOS_윈도우_Vim개발자세팅part3_surround_vim #surround #settings

https://youtu.be/hgeHORtxod0

<br>


# NeoVim surround

```
 Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```

https://github.com/kylechui/nvim-surround

<br>

<hr>

# Vim 자주누르는거 등록해서 쓰자 Abbreviations 약어 ㅎㅎ 역시 Vim은 내가 생각하는건 다 있다. ㅎㅎ역시 1970년대부터 쓰는 이유가 있다.


https://vimhelp.org/map.txt.html#abbreviations

<br>

<br>

<hr>


# 그외에 설명서 링크 모음

## 💕Vim Full Course tutorial- FreeCodeCamp

https://youtu.be/RZ4p-saaQkc


## 급하게 단축키 체크할 때 최고 다 있다. ㅋㅋㅋㅋ❤️👍

https://paulgorman.org/technical/vim.html



## 맥/Unix] 터미널 vi Editor 사용법- | Mac in June -

https://economiceco.tistory.com/m/11680


## Vim Training Class 1 - Basic motions and commands
https://youtu.be/Nim4_f5QUxA


## Vim: Tutorial on Editing, Navigation, and File Management (2018)

https://youtu.be/E-ZbrtoSuzw


## 다른 설명서

https://riptutorial.com/vim




# 다른 사람의 NeoVim Setting

❤️Personal Neovim Cheatsheet Cheat Sheet
by dcschmid

https://cheatography.com/dcschmid/cheat-sheets/personal-neovim-cheatsheet/
