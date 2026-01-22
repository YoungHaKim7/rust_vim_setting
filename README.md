# link
- [(외부링크)250223완전 초보를 위한 좋은 동영상 Explaining Vim Until I Go Insane | Mults](https://youtu.be/LuhAzI3wvmI?si=5Sr_d-m1eHjeoXl4)
- [빔 기초Vim tutorial_mastering-vim-your-guide-to-efficient-text-editing](#mastering-vim-your-guide-to-efficient-text-editing)
  - [Vim Cheat Sheet(그림으로 간단한 명령어 위주 & 완전 자세히)](#vim-cheat-sheet)
- [다른-외국인-설정-모음](#다른-외국인-설정-모음)

<hr />

- [(외부링크)Vim documentation(공식문서)](https://vimdoc.sourceforge.net/htmldoc/)
  - [nvim lua가이드 한글판](https://github.com/krapjost/nvim-lua-guide-kr)

<hr>

- [toml fmt](https://taplo.tamasfe.dev/cli/installation/binary.html)

<hr />

- [git commit 메세지를 설정하는 에디터가 기본적vim으로 변경](#git-commit-메세지를-설정하는-에디터가-기본적vim으로-변경)


<hr />

# toml Fmt
- https://github.com/tamasfe/taplo
  - [sample code](https://github.com/tamasfe/taplo/blob/master/taplo.toml)

```bash
taplo format Cargo.toml
```

- `.taplo.toml`

```toml
# See https://taplo.tamasfe.dev/configuration/file.html
# and https://taplo.tamasfe.dev/configuration/formatter-options.html

[formatting]
# Aligning comments with the largest line creates
# diff noise when neighboring lines are changed.
align_comments = false

# Matches how rustfmt formats Rust code
column_width = 100
indent_string = "    "
```

<hr />


# (Rust&Python_etc..)☆☆__VSCode Vs Pycharm(파이참)Vs Visual Studio(비주얼스튜디오)자주 쓰는 단축키 비교☆☆(MacOS,Win)[[🔝]](#link)

https://economiceco.tistory.com/3638

# VSCode Extensions 잘 정리됨[[🔝]](#link)

https://viatsko.github.io/awesome-vscode/

# rust_vim_setting[[🔝]](#link)

<br>

<hr>

# neovim-for-beginner[[🔝]](#link)

Companion code for the [Medium Neovim for Beginners series.](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a)


## my neovim set_lua setting(full 세팅)

```
:colorscheme tokyonight-night


// 어두운 빨간색2(inlay hint)
: hi Comment guifg=#cfe2f3 guibg=#92342d
```

<br>

# LunarVim InLayHint **\_**Comment Color[[🔝]](#link)

```
// 어두운 빨간색
: hi Comment guifg=#cfe2f3 guibg=#c90076


// 어두운 빨간색2
: hi Comment guifg=#cfe2f3 guibg=#92342d


// 밝은 분홍색 느낌
: hi Comment guifg=#cfe2f3 guibg=#ff439f




```

- color-hex

https://www.color-hex.com/color/ff439f

<br>

<hr>

# Vim정리 종결자[[🔝]](#link)

https://github.com/mhinz/vim-galore

# Vim Cheat Sheet[[🔝]](#link)
- https://www.facebook.com/share/p/Dh9nVyKqm1ySG3Ha/?mibextid=WC7FNe
![IMG_8452](https://github.com/user-attachments/assets/2b5d90c4-db98-4f96-a678-c6b28f7432b9)

- http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
![vi-vim-cheat-sheet](https://github.com/user-attachments/assets/57e8118e-d120-4d98-8539-2d327b612e01)
![vim-movement-commands-cheatsheet](https://github.com/user-attachments/assets/512f1edc-b6df-43d7-928a-fd561f950dc6)
![vim_cheat_sheet_for_programmers_screen](https://github.com/user-attachments/assets/ff7925a4-da96-4afd-a59c-2dde2a18cff9)


# Hyperpolyglot(Text Mode Editors: Vim, Emacs, Nano)

https://docs.huihoo.com/programming-language/hyperpolyglot.org/text-mode-editors.html

<br>

<hr>

# rust_neoVim_Setting[|🔝|](#link)

[neoVim_Setting Youtube](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

<hr>

> > Github
> > [Github_LunarVim](https://github.com/LunarVim/Neovim-from-scratch)

<br>

<hr />

# Undo & Redo[|🔝|](#link)
- https://www.warp.dev/terminus/undo-redo-in-vim

```
# undo많이 씀
u

# Redo
CTRL+R
# macOS에선 이렇게 세팅함. command + y
CMD + Y
 
```

<hr>

# 다른 사람의 정리된 Vim 정리 끝판왕(역시 이 세상에는 괴물들이 참 많다.ㅋ)[[🔝]](#link)

- Vim정리 종결자 https://github.com/mhinz/vim-galore

http://m.egloos.zum.com/mataeoh/v/7036315

https://profkuperman.com/help/vim/home.html

- graphic으로 잘 정리됨. 한눈에 다 들어옴(Normal, Insert mode, 등등)

  - http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html

<hr>

# 내가 나름 정리한 Vim tutorials[[🔝]](#link)

- https://economiceco.tistory.com/12352

Emacs Cheat Sheet❤️(Vim과 비교 젤 보기 좋다)👍
https://economiceco.tistory.com/14813

- ❤️ Hyperpolyglot
Text Mode Editors: Vim, Emacs, Nano
https://docs.huihoo.com/programming-language/hyperpolyglot.org/text-mode-editors.html


<hr>

<br>

# Emacs Setting[[🔝]](#link)

-[Lisp language*Emac_DoomEmacs_tutorial_LSP_Install*설치및자동완성활용법\_기초한글강의 #lisplang #emacs #doomemacs #lsp](https://youtu.be/xngl_-994Yg)

<br>

# Helix Editor Tutorial[[🔝]](#link)

한글러스트Rust강의\_041⭐️Rust로 만든 에디터Helix기초\_helix tutorial #rustlang #helix

- https://youtu.be/cZfF1XRoIC8

<br>

# VScode[[🔝]](#link)

- External terminal

https://code.visualstudio.com/docs/terminal/basics#_links

Note: Open an external terminal with the ⇧⌘C keyboard shortcut if you prefer to work outside VS Code.

```
macos

⇧⌘C

Command + Shift + C
```

setting.JSON

```json
{
    "terminal.integrated.fontFamily": "MesloLGS NF",
    "terminal.external.osxExec": "Warp.app"
}
```

<br>

# Lapce Editor[[🔝]](#link)

- 한글러스트Rust강의*038_lapce*⭐️Rust_traits기초 #rustlang

https://youtu.be/Gpe-zGS5W0I

# 다른 외국인 설정 모음[[🔝]](#link)
- https://gist.github.com/LukeMathWalker
- https://github.com/BurntSushi/dotfiles
- 옛날 코드지만 배울게 많다. 루비로 세팅
  - https://github.com/carlhuda/janus

<hr>

# Mastering VIM: Your Guide to Efficient Text Editing[[🔝]](#link)

- https://www.freecodecamp.org/news/mastering-vim-your-guide-to-efficient-text-editing/
  - VIM Essentials Course for Beginners | freeCodeCamp.org
    - https://youtu.be/JYNA9j8SXs4?si=BFs84HXofXHg36Mt

# git commit 메세지를 설정하는 에디터가 기본적vim으로 변경[|🔝|](#link)

- git commit 메세지를 설정하는 에디터가 기본적으로는 nano 에디터일 텐데, nano에디터에는 익숙하지 않아서 vim으로 바꿨었다. vim으로 바꾸는 커맨드는 다음과 같다.

```bash
$ git config --global core.editor vim
```

- git commit 메세지를 sublime text로 저장하는 방법 - https://thinkpro.tistory.com/m/142


# git default Vim설정

```bash
git config --global core.editor "vim"

```
