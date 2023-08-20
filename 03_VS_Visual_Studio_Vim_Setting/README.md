# Visual Assist supports keyboard access to all of its features. (Visual Studio Plugin _ VAssistX | Help | Keyboard Shortcuts.)

- VAssistX무조건 필요하다.(Visual Studio 필수Plugin)

  - https://docs.wholetomato.com/default.asp?W375

<hr>

# CodeNav 2022(Vista같은거 좋다. Good무료

Show the code structure of your current document

https://marketplace.visualstudio.com/items?itemName=SamirBoulema.CodeNav2022

# ReSharperC

https://marketplace.visualstudio.com/items?itemName=JetBrains.ReSharperC

# Source

https://github.com/justinmk/config/blob/master/.vsvimrc


https://github.com/justinmk/config

# Vim Setting Path 찾기

```

:set vimrcpaths?

```

# 주로 쓰는 Visual Studio Keymap

```
Ctrl+R - rename (LSP 이거 많이 쓸듯)
Ctrl+e+e 에러 체크 하단에 빨리 표시해줌(TroubleToggle비슷)

gkd   자동 정렬로 세팅함 Auto Fmt


gwo    Full -Screen

// comment <space>/      &  Uncomment <space>//
xnoremap <space>/ :vsc Edit.CommentSelection<cr>
xnoremap <space>// :vsc Edit.ToggleLineComment<cr>


// 빠르게 오류 찾고 수정하기 (ga)
nnoremap <space>lj :vsc Edit.GoToNextIssueinFile<cr>
nnoremap <space>lk :vsc Edit.GoToPreviousIssueinFile<cr>

"" QuickFix   Ctrl + .
nnoremap ga :vsc EditorContextMenus.CodeWindow.QuickActionsForPosition<cr>


```


```

Multi-caret multiple insertion points	    Ctrl+Alt+click
Multi-caret add matching selection	      Shift+Alt+Ins
Format Document	                          Ctrl+K,D  

```
