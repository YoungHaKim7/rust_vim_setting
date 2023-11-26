# Quick Fix 도저히 못찾음 
- IntelliJ Quick fix https://www.jetbrains.com/help/idea/intention-actions.html#intention-settings
- ```Ctrl+Y```  난 vim으로 ctrl+y 많이 쓰는데 android studio 단축키 와 중복되니 에러남 그래서 key map에서 단축키 삭제함 !!
```
// 자동 완성 키
Ctrl + Space 좋다. 

// Quick Fix
Alt + Enter

Alt + 6   -> Trouble Toggle 같은거


// 블럭 치하고 줄 라인 위로 옮기기 많이 쓰는 기능
Alt + Shift + ↑
```


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

```
:actionlist
  
```


# Android Studio에 Vim Plugin 설치 

https://lektion-von-erfolglosigkeit.tistory.com/m/177
