# VimKey Setting(명령어 찾기)
- https://stackoverflow.com/questions/69022964/how-can-you-map-ideavimrc-to-switch-between-tabs-in-intellij

```
Open search everywhere > Actions

```


# Inlay Hint 컬러 경로


```
setting -> Editor -> Color Scheme -> Language Defaults -> Inline hints

setting
└────Editor
     └─────────Color Scheme
               └────── Language Defaults
                       └────── Inline hints
Default

parameters

// 요즘 쓰는 색 240106
:hi LspInlayHint guifg=#35638f guibg=#420517
:hi Comment guifg=#35638f guibg=#420517
```

# Vim plugin 꿀팁
- https://stackoverflow.com/questions/3368792/intellij-idea-shortcut-for-switching-to-tab-by-number/3369067#3369067

```
If you are using IntelliJ's IdeaVim plugin, the vim style shortcut works as well:

    gt, go to next tab
    gT, go to the previous tab
    1gt, go to the first tab
    2gt, go to the second tab
    3gt, ....
```



<hr />

# IdeaVim – A Vim engine for JetBrains IDEs

https://github.com/JetBrains/ideavim

- IdeaVim – A Vim engine for JetBrains IDEs

  - https://plugins.jetbrains.com/plugin/164-ideavim


# JetBrains/Ideavim

https://github.com/JetBrains/ideavim#Files

- IdeaVim
  - Do you want to enable repeating keys in macOS on press and hold?

    - (You can do it manually by running 'defaults write -g ApplePressAndHoldEnabled 0' in the console).
