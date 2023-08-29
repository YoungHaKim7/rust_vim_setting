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

# 주로 쓰는 Visual Studio Keymap(공식 키가 아니라 내가 맘대로 세팅 바꿈)

```
Ctrl+R - rename (LSP 이거 많이 쓸듯)
Ctrl+t+t 파이썬 처럼 한줄 넣어서 test??잘 모르겠음.
Ctro+t+r CodeMetricsResults(뭔지 정확히 모름 ㅡㅡ)
Space+t 에러 체크 하단에 빨리 표시해줌(TroubleToggle비슷)

gkd   자동 정렬로 세팅함 Auto Fmt


gwo    Full -Screen

// comment <space>/      &  Uncomment <space>//
xnoremap <space>/ :vsc Edit.CommentSelection<cr>
xnoremap <space>// :vsc Edit.ToggleLineComment<cr>


// 빠르게 오류 찾고 수정하기 (ga) or space a 2개 로 만듬
nnoremap <space>lj :vsc Edit.GoToNextIssueinFile<cr>
nnoremap <space>lk :vsc Edit.GoToPreviousIssueinFile<cr>


"" QuickFix   Ctrl + .
nnoremap ga :vsc EditorContextMenus.CodeWindow.QuickActionsForPosition<cr>
" ""<space>lj  or lk "" my setting 
nnoremap <space>lj :vsc Edit.GoToNextIssueinFile<cr>
nnoremap <space>lk :vsc Edit.GoToPreviousIssueinFile<cr>

""~~VAssistX(Visual Assist Keyboard Shortcuts)
nnoremap <space>a :vsc VAssistX.RefactorContextMenu<cr>

nnoremap <c-t>t :vsc InteractiveConsole.ExecuteInInteractive<cr>
nnoremap <c-t>r :vsc View.CodeMetricsResults<cr>



"" Automatic completion input
inoremap <c-y> :vsc Edit.CompleteWord

"" 속성으로 빨리 한방에 !! 이동
nnoremap g^ :vsc SolutionExplorer.SyncWithActiveDocument<cr>

" 이름 바꾸기 space+r
nnoremap <space>r  :vsc Refactor.Rename<cr>

```


```

Multi-caret multiple insertion points	    Ctrl+Alt+click
Multi-caret add matching selection	      Shift+Alt+Ins
Format Document	                          Ctrl+K,D  

```


# vim의 mark 활용하기

1. Mark 저장하고 내가 저장한 mark로 이동하기

```
// a에 현재 라인을 저장함
ma


// 저장된 a로 이동하기
'a
```



2. Mark 삭제
-사용자가 정의한 Mark를 삭제합니다.

```
// Mark a 삭제
:delmarks a
	

 
//  Mark a, b, c, d 삭제
:delmarks a-d

// Mark a, b, x, y 삭제
:delmarks abxy
	

// Mark a, A 삭제 
:delmarks aA



// 소문자 Mark 모두 삭제
:delmarks!
	
```

출처 : https://blog.naver.com/chhh92/220569044272



# etc Visual Studio ShortcutSet

- Visual Studio keyboard shortcut to display IntelliSense
  - https://stackoverflow.com/questions/3640544/visual-studio-keyboard-shortcut-to-display-intellisense
  - https://blog.novacare.no/change-intellisense-shortcuts-in-visual-studio/
