# Shift Vim에 세팅하는 방법 S이게 쉬프트구나 ㅎ

- 외국 사람들이 만든 세팅 참고 할께 많다.
  - https://github.com/JetBrains/ideavim/discussions/303
  - 고수의 세팅 https://github.com/citizenmatt/dotfiles/blob/master/ideavimrc
  - NERDTree 추가 예정 굿 https://github.com/cz2415/dotfiles/blob/master/.ideavimrc
- It should be ```<S-F3>``` not ```<SHIFT-F3>```, see :help key-notation in Vim.
- 추가 할만것 https://github.com/q843705423/ideavimrc/blob/master/.ideavimrc
```
"debug Artifact
nmap <C-j> :action StepOver<CR>
nmap <C-k> :action Resume<CR>
nmap <C-h> :action StepOut<CR>
nmap <C-l> :action ForceStepInto<CR>
```

- 추가할 한것 3 (Shift + Space )를 이렇게 넣는다.https://gist.github.com/AlexPl292/50a3ff4cef1badcbb23436b22cbd3cf4
```
map <S-Space> <Action>(GotoNextError)
```

https://superuser.com/questions/508655/map-shift-f3-in-vimrc
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

Alt + 6   -> Trouble Toggle 같은거


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
