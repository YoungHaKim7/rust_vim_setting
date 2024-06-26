# InlayHint 컬러 세팅(Android_Studio)
- (27분40초)003개고생하면서 배우는 Kotlin 집중 분석 _Divided&Conquer(helix, Android Studio Debugging)
  - https://www.youtube.com/live/6AFS3GFTOH4

# Shift Vim에 세팅하는 방법 S이게 쉬프트구나 ㅎ
- 한국사람의 ideavimrc
  - https://velog.io/@minkyu__k/.ideavimrc

- 외국 사람들이 만든 세팅 참고 할께 많다.
  - https://github.com/JetBrains/ideavim/discussions/303
  - 고수의 세팅 https://github.com/citizenmatt/dotfiles/blob/master/ideavimrc
  - NERDTree 추가 예정 굿 https://github.com/cz2415/dotfiles/blob/master/.ideavimrc
  - set 명령어 정리 잘됨. https://blog.sinoroo.com/entry/VIM-%EB%8B%A8%EC%B6%95%ED%82%A4-%EB%B0%8F-%EC%84%A4%EC%A0%95
- It should be ```<S-F3>``` not ```<SHIFT-F3>```, see :help key-notation in Vim.
- 알트Alt키 세팅하는 방법
  - https://vimdoc.sourceforge.net/htmldoc/map.html#:map-alt-keys
  - https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
- 추가 할만것 https://github.com/q843705423/ideavimrc/blob/master/.ideavimrc
```
"debug Artifact
nmap <C-j> :action StepOver<CR>
nmap <C-k> :action Resume<CR>
nmap <C-h> :action StepOut<CR>
nmap <C-l> :action ForceStepInto<CR>
""""""""""""""""""""""""""""""""""""""Debug""""""""""""""""""""""""""""""""""""""
noremap <Space>bp :action ToggleLineBreakpoint<CR>
noremap <Space>qe :action QuickEvaluateExpression <CR>
noremap <Space>ee :action EvaluateExpression <CR>
noremap <Space>fr :action Debugger.ForceEarlyReturn<CR>
noremap <Space>daw :action Debugger.AddToWatch<CR>
noremap <Space>fc :action ForceRunToCursor<CR>
noremap <Space>hs :action Hotswap<CR>
noremap <Space>DD :action JRebel Debug<CR>
noremap <Space>rab :action Debugger.RemoveAllBreakpointsInFile<CR>
noremap <Space>raB :action Debugger.RemoveAllBreakpoints<CR>
noremap <Space>df :action Debugger.PopFrame<CR>
noremap <Space>pp :action ShowExecutionPoint<CR>
noremap <Space>ds :action StreamTracerAction<CR>
noremap <Space>mb :action XDebugger.MuteBreakpoints<CR>
```

- 추가할만한 것 2 (NERDtree이건 못 참지)
```
" plugins
set NERDTree

// lunarvim키로 할 예정
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>ef :NERDTreeFind<CR>

// i 파일 실행
// m 메뉴 창 나옴
//  md엔터 파일 삭제
//  mR엔터엔터 파일 이름 바꾸기

// NERDTree 창 닫기  // 난 <leader>x 로 닫는거 세팅함. 개편함 
Shift + Esc
```
https://github.com/cz2415/dotfiles/blob/master/.ideavimrc
- 추가할 한것 3 (Shift + Space )를 이렇게 넣는다.https://gist.github.com/AlexPl292/50a3ff4cef1badcbb23436b22cbd3cf4
```
map <S-Space> <Action>(GotoNextError)
```
https://superuser.com/questions/508655/map-shift-f3-in-vimrc

<hr>

- test

```

```

- set키까지 대단하네
```
set <S-F3>=^[O1;2R
nnoremap <S-F3> :lprevious<CR>
```

- https://github.com/hsanson/vim-android


# action

```
// Symbol 이동
:action GotoSymbol

// File이동 
:action GotoFile

// Class이동 
:action GoToClass
```

# Quick Fix 도저히 못찾음 
- IntelliJ Quick fix https://www.jetbrains.com/help/idea/intention-actions.html#intention-settings
- 난 vim으로 ```Ctrl+y``` 많이 쓰는데 android studio 단축키 와 중복되니 에러남 그래서 key map에서 단축키 삭제함 !!
```
// 자동 완성 키
Ctrl + Space 좋다. 

// Quick Fix
Alt + Enter

// Problem
Alt + 6   -> Trouble Toggle 같은거


// NERDTree 창 닫기
Shift + Esc


// 블럭 치하고 줄 라인 위로 옮기기 많이 쓰는 기능
Alt + Shift + ↑

```
- 자동완성 굿 you have MenuInflater and type in MenuI, and then ```CTRL+SPACE```, which means you tell the IDE that you want to use the autocomplete dropdown, and then press space, it works as you wish.
  - https://stackoverflow.com/questions/38029675/android-studio-autocomplete-on-special-character-space-period-etc-like-in-v

# 이거 보고 세팅함 

https://www.slideshare.net/imkimkevin/android-studio-vim-ideavim-94820340

- surround
```
# ~/.ideavimrc
set surround
```
<hr>

- multi-cursor

```
# ~/.ideavimrc
set multiple-cursors
```
- 비주얼 영역 혹은 현재 커서 위치와 매칭 되는 단어를 선택하여 여러 개를 동시에 선택할 수 있습니다. <Alt> + N키를 이용하여 시작하며 <Alt> + N 다음 단어 선택, <Alt> + P 이전 단어, <ALT> + X 현재 단어 스킵입니다. 기존 라이브러리에서는 Ctrl 키와 맵핑되었지만 단축키가 겹치는 문제점 때문에 Ideavim에서는 Alt 키와 맵핑되어있습니다.

- https://medium.com/harrythegreat/ideavim%EC%97%90%EC%84%9C-%EC%82%AC%EC%9A%A9%EA%B0%80%EB%8A%A5%ED%95%9C-plugin-%EC%A0%95%EB%A6%AC-c3f49c6a705d

<hr>

# actionlist 보기 
- https://gist.github.com/kimkevin/4ddd9caf5252a059e67764eec3be8fdf
  - 이거 더 최신인듯
    - https://gist.github.com/zchee/9c78f91cc5ad771c1f5d

```
:actionlist
  
```


# Android Studio에 Vim Plugin 설치 

https://lektion-von-erfolglosigkeit.tistory.com/m/177

- autocomplte먹통일때
  - https://copyprogramming.com/howto/why-the-intellij-code-autocomplete-doesn-t-work
