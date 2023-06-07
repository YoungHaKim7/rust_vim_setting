# Eclipse

https://www.eclipse.org/

# Eclipse __Vim Plug in (vrapper) 

https://vrapper.sourceforge.net/home/

  - Documentation https://vrapper.sourceforge.net/documentation/?topic=configuration#config

  - keymap https://vrapper.sourceforge.net/documentation/index.php?topic=commands

  
  - 키 설정 궁금한거 https://sourceforge.net/p/vrapper/discussion/901740/


# Relative Line Number Ruler

https://marketplace.eclipse.org/content/relative-line-number-ruler

# 자동정렬Auto Fomat

- Save할때 자동정렬 시키는 방법 https://hianna.tistory.com/653

- macOS https://velog.io/@jhyeom1545/%EB%A7%A5%EB%B6%81-%EB%8B%A8%EC%B6%95%ED%82%A4#:~:text=%E2%8C%98%20%2B%20%E2%87%A7%20%2B%20F%20%3A%20%EC%BD%94%EB%93%9C%20%EC%9E%90%EB%8F%99%20%EC%A0%95%EB%A0%AC%EC%9D%84%20%EC%82%AC%EC%9A%A9%ED%95%A9%EB%8B%88%EB%8B%A4.


```
// WindowsOS
단축키 ( Ctrl + Shift + F )


// macOS
⌘ + ⇧ + F : 코드 자동 정렬을 사용합니다.
Command

⌥ + spacebar : 코드 자동완성 기능을 사용합니다.(eclipse 단축키 매핑을 따로 수정해서 설정하였습니다)

```


# Configuration File
The options described above only change the behaviour of the editor in which they are set. To change the default configuration, a file is used. When a new editor is opened, the plugin checks for a file called .vrapperrc (or _vrapperrc to make it easier for Windows people). This file is expected to be in the user's HOME directory but may be overridden by setting the system property vrapper.vrapperrc when launching Eclipse (-Dvrapper.vrapperrc=<file>). If this file is found, the commands in the file are executed. You may use any configuration command in this file. As with .vimrc files, the leading : may be omitted in the configuration file.
    
  https://vrapper.sourceforge.net/documentation/?topic=configuration

This is an example of the contents of a configuration file:

```
noremap d h
noremap h j
noremap t k
noremap n l
noremap e d
noremap E D
noremap l n
noremap L N
noremap s :
noremap ` ^
noremap k e
noremap K E
imap jj <esc>
map L $
map H ^
set autoindent
set ignorecase
set smartcase
```

  # Install
  
  - https://www.eclipse.org/downloads/packages/installer
  
  - macOS
  
    - https://formulae.brew.sh/cask/eclipse-ide
  
  - WindowsOS
  
    - choco https://community.chocolatey.org/packages/eclipse
