# Link

- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#-all-things-vim">Vim 설명서 끝짱판 All Things Vim</a>
- [Vim 클립보드 설치해서 *y되게 만들기](#vim-클립보드-설치해서-y되게-만들기)
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-%EC%B0%BD-%EB%82%98%EB%88%84%EA%B8%B0">Vim 창 나누기</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-%EC%9B%80%EC%A7%81%EC%9E%84-%EA%B4%80%EB%A0%A8hjkl">Vim 움직임 관련(hjkl)</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-buffer--tabnew">vim buffer 활용법tabe많이 씀</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-command--key">Vim : Command 글씨 바꾸기 같은거:set number rnu하이브리드 모드 젤 좋다. ㅋ</a>

- [Sort 패턴](#sort-패턴)

- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-ex-commands-m-t-and-co">move copy command :</a>

- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#vim-normal-%ED%99%9C%EC%9A%A9%EB%B2%95">normal활용법</a>

- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#marks%ED%99%9C%EC%9A%A9%EB%B2%95">mark활용법</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#macro-%ED%99%9C%EC%9A%A9%EB%B2%95">매크로 활용법Macro Vim 꽃 매크로</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#--%EA%B4%84%ED%98%B8-%EC%95%88%EC%97%90-%EA%B2%83%EB%A7%8C-%EC%A7%80%EC%9A%B0%EA%B8%B0">c활용법 괄호 안에 글씨만 지우기 테그 안에 지우기 등등 cit ci( ci{</a>
- <a href="https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings#surround-vim">Surround Vim이걸 모르면 빔을 쓸줄 모르는 사람</a>

- [windows-neovim-초간단-세팅](#windows-neovim-초간단-세팅)

- [네오빔 최종 세팅Taaby+Snippets완료](#neovimrust최종세팅)

<hr>

# NeoVim(Rust최종세팅)
- https://github.com/YoungHaKim7/rust_dev_neovide_nvimsetting

# vim9(다른 사람이 설정한거)
- https://github.com/arp242/dotfiles/blob/master/vim/vimrc

# Vim 클립보드 설치해서 *y되게 만들기[[🔝]](#link)
- https://velog.io/@markyang92/xclip-linux-%ED%81%B4%EB%A6%BD%EB%B3%B4%EB%93%9C-vim-%EC%8B%9C%EC%8A%A4%ED%85%9C-%ED%81%B4%EB%A6%BD%EB%B3%B4%EB%93%9C

```
# LinuxOS에서는 +레지스터에 넣어야 한다.
"+y


# macOS & windows * 레지스터에 넣어주면 된다.
"*y
```
- xclip 설치

```
$ sudo apt update
$ sudo apt install xclip -y
```

- vim 시스템 클립보드
  - 시스템 클립보드를 사용하는 Vim을 쓰려면, vim-huge 버전인 gvim, vim-gtk, vim-gnome을 설치해야 시스템 클립보드를 사용할 수 있다.

```
$ sudo apt update && sudp apt install vim-gtk -y
# vim-gtk를 지원하지 않는다면, vim-gnome, gvim 설치
```

# nvim 초기화 에러 나면 초기화 해서 다시 세팅하자[[🔝]](#link)

```
$ rm -rf ~/.local/share
$ rm -rf ~/.config/nvim/
```
- FUSE 관련 문제 발생시


```
$ sudo add-apt-repository universe
$ sudo apt install libfuse2
```

https://velog.io/@mohadang/Rust-NVIM-%EC%84%A4%EC%A0%95

# 내가 세팅한거 최소한으로 에러 안나게 세팅[[🔝]](#link)
- https://github.com/YoungHaKim7/lvim_Rust_AI_Setting

# friendly-snippets rust.json경로[[🔝]](#link)

```bash
local/share/lunarvim/site/pack/lazy/opt/friendly-snippets/snippets/rust/rust.json
```

<hr>

# 주로 쓰는 PlugIn[[🔝]](#link)

- 요즘 많이 쓰는 LunarVim Setting https://github.com/YoungHaKim7/lvim-config_gyoung_tabby_AI_Setting

- ```:PlugInstall```
- ```:PlugClean```

```
" =========================================================================
" =  플러그인 설정                                                        =
" =========================================================================

if has('python3')
endif

call plug#begin('~/.vim/plugged') " 플러그인 시작

" Conquer Of Completion 자동완성 플러그인
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Manson Install Lsp 관리
" Plug 'williamboman/mason.nvim'

" nvim-treesitter 구문 파싱 하이라이팅
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'majutsushi/tagbar'
" Plug 'preservim/tagbar'

" NERDTree 코드 뷰어 창
Plug 'preservim/nerdtree'

" 컬러스킴(색상표) jellybeans, gruvbox
Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'

" 하단에 다양한 상태(몇 번째 줄, 인코딩, etc.)를 
" 표시하는 상태바 추가
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CScope 플러그인
Plug 'ronakg/quickr-cscope.vim'

" CtrlP 파일 탐색 플러그인
Plug 'ctrlpvim/ctrlp.vim'

" 비활성 윈도우 강조
" Plug 'blueyed/vim-diminactive'

" vim cutlass 잘라내기 명령어가 yank 에 영향을 주지 않음
" Plug 'svermeulen/vim-cutlass'

" VIM GAS(GNU ASsembler) Highlighting
Plug 'Shirk/vim-gas'

Plug 'Yggdroot/indentLine' " Visually displaying indent
Plug 'townk/vim-autoclose'  " automatic closing of parentheses
Plug 'luochen1990/rainbow' "colorful brackets.

Plug 'ycm-core/YouCompleteMe' "automatic_completion

""""" Rust
Plug 'rust-lang/rust.vim' "rust
Plug 'fannheyward/coc-rust-analyzer' "rust_analyzer
Plug 'mattn/vim-lsp-settings' "rust_analyzer__lsp
Plug 'liuchengxu/vista.vim' " rust vista
Plug 'prabirshrestha/vim-lsp' 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'} "debug
Plug 'idanarye/vim-vebugger' "debug_
"""""""""""""""""

Plug 'kamykn/spelunker.vim' "smarter way to correct spelling mistakes

Plug 'tpope/vim-surround'

" C
Plug 'justmao945/vim-clang'

" :UnicodeTable    - Print Unicode Table in new window
Plug 'chrisbra/unicode.vim'

"""""""~~~~zig
Plug 'ziglang/zig.vim'
Plug 'UltiRequiem/coc-zig', {'do' : 'yarn install --frozen-lockfile && yarn build'}
""""""~~~~~~

" Add Tabby plugin__Self-hosted AI coding assistant 
Plug 'TabbyML/vim-tabby'

call plug#end()
```

<hr>

# LunarVim/Neovim - Debugging Demo | Java, Python, Rust, Go, Javascript | chris@machine[[🔝]](#link)


https://youtu.be/5KQK2id3JtI?si=fvye14gmjpZR0Ehk

<hr>

# Vim & NeoVim 용 AI 세팅[[🔝]](#link)
- Free, ultrafast Copilot alternative for Vim and Neovim
  - www.codeium.com/ 
    - Vim https://github.com/Exafunction/codeium.vim
    - NeoVim https://github.com/jcdickinson/codeium.nvim

<hr>

# 자동 완성 소스로 주석과 문자열 추가 지정 & 한 글자만 입력해도 작동할 것 &  list completion 키를 &lt;C-n&gt;, &lt;C-p&gt;를 설정해 사용하고 있다[[🔝]](#link)

https://johngrib.github.io/wiki/vim/auto-completion/#youcompleteme

<br>
	[[🔝]](#link)
# 🎓 All things Vim!

  - https://github.com/mhinz/vim-galore

![vim](https://user-images.githubusercontent.com/67513038/222637131-c15dad57-5463-4e7c-b087-67c591daf544.png)
[VimGraphical_Cheat_Sheet](http://www.viemu.com/vi-vim-cheat-sheet.gif)

# Vim Graphical Cheat Sheet Tutorial[[🔝]](#link)

  - http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html

# 초보자를 위한 Vim설명서(Vim CheatSheet)[[🔝]](#link)

- https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet/


# VIM Tips & Tricks[[🔝]](#link)

https://youtube.com/playlist?list=PLpqQbpeQxfW0eJK-LSEzuEeC1u5vsQOUO

# NeoVim docs[[🔝]](#link)

https://neovim.io/doc/user/map.html

<br>

https://neovim.io/doc/user/index.html

<br>

<hr>

# Dotfiles[[🔝]](#link)

https://gitlab.com/dwt1/dotfiles

<br>

# CocConfig(vim)[[🔝]](#link)

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


# :CocCommand[[🔝]](#link)



# CocCommand 다음 FUZZY> rust-analyer.viewHir View Hir 입력[[🔝]](#link)

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

# Rust Doc std(standard Library DOC)[[🔝]](#link)

https://doc.rust-lang.org/std/

<br>

##  DOCS.RS(rust 기타 crate문서들)[[🔝]](#link)

https://docs.rs/

<br>

<hr>

# Learn Rust With Entirely Too Many Linked Lists[[🔝]](#link)

https://rust-unofficial.github.io/too-many-lists/index.html

<br>

<hr>

<br>

# Rust Design Patterns[[🔝]](#link)

https://rust-unofficial.github.io/patterns/intro.html

<br>

<hr>

# LunarVim InLayHint _____Comment Color[[🔝]](#link)

```
// 어두운 빨간색
: hi Comment guifg=#cfe2f3 guibg=#c90076


// 밝은 분홍색 느낌
: hi Comment guifg=#cfe2f3 guibg=#ff439f

```

- color-hex

https://www.color-hex.com/color/ff439f

<br>

## LunarVim Hover [[🔝]](#link)

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


# Vim Setting (type 빨강색으로 강조하기 칙칙한 검은색 너무 싫다.)[[🔝]](#link)

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

# vim documentation scroll(Vim key map)[[🔝]](#link)

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

# Vim Command[[🔝]](#link)

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

# Vim CocInstall (rust-analyzer)[[🔝]](#link)

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

# Vim 창 나누기[[🔝]](#link)

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

# Vim 자료 모음[[🔝]](#link)

https://economiceco.tistory.com/12352


<br>

<hr>

<br>

<hr>

# Vim 움직임 관련(hjkl)[[🔝]](#link)

```
 k
hjl

s 커서 자리에서 삭제하면서 insert 모드 많이 쓴다.

S 한줄 다 지우면서 insert 모드


x Visual Mode 로 커서 자리만 지우기

X Visual Mode로 백스페이스랑 동일 (Visual mode 유지)


```

<br>

# Vim buffer & tabnew[[🔝]](#link)

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
 

tab 닫기(보통 bd를 많이 쓴따. 홈페이지에서 이걸 권장함:bd
:bd 
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

# Vim command & key[[🔝]](#link)

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

//gc는 y/n로 바꿀 꺼 물어봄.(문서 전체 적용됨)
:%s/바꿀 단어(전)/바꿀 단어(후)/gc

////gc는 y/n로 바꿀 꺼 물어봄.(라인 1줄만 적용됨)
:s/바꿀 단어(전)/바꿀 단어(후)/gc

// 선택한 영역에 있는 특정 패턴을 다른 패턴으로 치환하기
블럭칠해주고(c-v)
:'<'>s/pattern/target/g (Visual mode)

라인 이동
15gg
15G
똑같음 (15줄로 이동)
```

# sort 패턴[[🔝]](#link)

```
// 여러줄 이쁘게 알파벳으로 정렬됨 최고
// 내가 원하는 줄 블럭 씌우고
:누르면
:'<,'> 이렇게 나오는데

뒤에 그대로 sort
:'<,'>sort


// 여러줄 이쁘게 알파벳으로 정렬됨 최고

```

# Vim ex commands: m, t and co[[🔝]](#link)
- ```:m``` is an abbreviation for ```:move```, ```:t``` and ```:co``` are abbreviations for ```:copy```. 
```
// m15 패턴 (지금 라인을 15로 이동)
:m 15
:m15

// t 15 패턴 (지금 라인을 15로 카피 copy)
:t 15
:t15

// 지금 줄에서 2번째 줄을 43줄 밑으로 복사하기(여러줄을 move)
:+1, +2 m 43

// 지금 줄에서 2번째 줄을 43줄 밑으로 복사하기(여러줄을 copy)
:+1, +2 t 43




// 지금 라인을 밑으로 2줄 옮기기 move
:+2m$

```

https://renenyffenegger.ch/notes/development/vim/commands/m


# Vim normal 활용법[[🔝]](#link)
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

# // normal 활용법
57초

https://youtu.be/ZeMcpSR6fXI



# Marks활용법

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


# Macro 활용법[[🔝]](#link)
```
내가 만든 매크로 @x 골맹이 x에 저장된 매크로 문서 전체에 실행하기
:%norm @x
Run macro @x on all lines
```
vim의 꽃은 역시 매크로macro❤️
빔Vim Macro 매크로_활용법 I love❤️vim~~👍~반복 작업은 Bye Bye #vim #macro

https://youtu.be/VRqpMXF32qk

# for command Macro 활용법[[🔝]](#link)

```
:for i in range(1, 100) | put = ', '.i | endfor

// Result(이렇게 출력됨)
1
,2
,3
.
.
.
,98
,99
,100

```

https://youtu.be/MPpb8azhsiM?si=ql-yzFQi-b-2ejda

```
1
2
3
4
5
6
7
8
9
10
//이렇게 출력하면
:for i in range(1, 100) | put = ''.i | endfor
```

<br>


# spell checker!![[🔝]](#link)

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


# Normal mode key[[🔝]](#link)

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

# {} () 괄호 안에 것만 지우기[[🔝]](#link)


## ```dit``` ```ci{``` ```cit``` ```ci(```


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

# surround vim[[🔝]](#link)

- 글자(단어)에 "" 씌우기 ```ysiw"```

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


# NeoVim surround[[🔝]](#link)

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

# Vim 자주누르는거 등록해서 쓰자 Abbreviations 약어 ㅎㅎ 역시 Vim은 내가 생각하는건 다 있다. ㅎㅎ역시 1970년대부터 쓰는 이유가 있다.[[🔝]](#link)


https://vimhelp.org/map.txt.html#abbreviations

<br>

<br>

<hr>


# 그외에 설명서 링크 모음[[🔝]](#link)

## 💕Vim Full Course tutorial- FreeCodeCamp

https://youtu.be/RZ4p-saaQkc


## 급하게 단축키 체크할 때 최고 다 있다. ㅋㅋㅋㅋ❤️👍[[🔝]](#link)

https://paulgorman.org/technical/vim.html



## 맥/Unix] 터미널 vi Editor 사용법- | Mac in June -[[🔝]](#link)

https://economiceco.tistory.com/m/11680


## Vim Training Class 1 - Basic motions and commands[[🔝]](#link)
https://youtu.be/Nim4_f5QUxA


## Vim: Tutorial on Editing, Navigation, and File Management (2018)

https://youtu.be/E-ZbrtoSuzw


## 다른 설명서[[🔝]](#link)

https://riptutorial.com/vim




# 다른 사람의 NeoVim Setting[[🔝]](#link)

❤️Personal Neovim Cheatsheet Cheat Sheet
by dcschmid

https://cheatography.com/dcschmid/cheat-sheets/personal-neovim-cheatsheet/


# Java Setting[[🔝]](#link)

https://github.com/neoclide/coc-java

- Install this extension by run command:

```
:CocInstall coc-java
```


# Windows NeoVim 초간단 세팅[[🔝]](#link)

- init.vim(C:\Users\User\AppData\Local\nvim)
```vim
" Move visually selected lines up or down in various modes.
" nnoremap K :m .-2<CR>==
" nnoremap J :m .+1<CR>==

let mapleader = " "
 
nnoremap <leader>bt :tabe<CR>
nnoremap <leader>btt :terminal pwsh.exe<CR>

nnoremap L <C-w>gt
nnoremap H <C-w>gT

" Line Move Up & Down
vnoremap K :m '<-2<CR>gv==gv
vnoremap J :m '>+1<CR>gv==gv"~~~~~~~~~

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>

" Esc and Clear Hightligh
nnoremap <Esc> :noh<return><Esc>

" rename
"
nnoremap <leader>rnn :%s//gc<Left><Left><Left>
""~ Set End
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" esc setting
inoremap jk <Esc>

" color setting
" colorscheme jellybeans

" relative number line
set number relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showmode
set so=5
set ignorecase  " Make searches case-insensitive
set incsearch
set mousehide

" font&size setting
set guifont=MesloLGS_NF:h16

set encoding=utf-8

" Editor Language setting
let $LANG = 'en'

" backup folder setting
set undodir=c:\\Users\\user\\vimdata\\undo\\
set backupdir=c:\\Users\\user\\vimdata\\backup\\
set directory=c:\\Users\\user\\vimdata\\swap\\

```

# NERDTree 키세팅 바꾸기
- https://vi.stackexchange.com/questions/27771/how-to-map-nerdtree-commands

- if you look at the NERDTree manual, there is a section called NERDTreeMappings search for "Default Key: o", doing that will take you that particular mapping's description and the variable to remap that binding, the variable is named after the "Map setting:" part of the corresponding binding, which for "o" is:

```
Default key: o
Map setting: NERDTreeMapActivateNode
```

- so to remap it you would put this in your .vimrc or init.vim
```
let NERDTreeMapActivateNode = 'i'
```
