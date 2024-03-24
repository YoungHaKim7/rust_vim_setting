# VSCode (Command Palette창에 유용하게 쓸만하거 모음)
코드 창을 분할해서 오른쪽or 왼쪽 창에 터미널 창 열어서 코드 옆에 아주 크게 열기

- Command Palette창에

```
Terminal : Create New terminal in Editor Area to the Side
```

<hr>

# Vim (VSCode) 세팅 가이드 
https://marketplace.visualstudio.com/items?itemName=vscodevim.vim


- ```settings.json```  Visual모드에서도 탭 할때 Visual모드가 풀리는데 그거 막아준다. 굿
```json
    "vim.visualModeKeyBindings": [
        {
            "before": [
                ">"
            ],
            "commands": [
                "editor.action.indentLines"
            ]
        },
        {
            "before": [
                "<"
            ],
            "commands": [
                "editor.action.outdentLines"
            ]
        },
    ],
```

VS Code has a lot of nifty tricks and we try to preserve some of them:

- ```gd``` - jump to definition.
- ```gq``` - on a visual selection reflow and wordwrap blocks of text, preserving commenting style. Great for formatting documentation comments.
- ```gb``` - adds another cursor on the next word it finds which is the same as the word under the cursor.
- ```af``` - visual mode command which selects increasingly large blocks of text. For example, if you had "blah (foo [bar 'ba|z'])" then it would select 'baz' first. If you pressed af again, it'd then select [bar 'baz'], and if you did it a third time it would select "(foo [bar 'baz'])".
- ```gh``` - equivalent to hovering your mouse over wherever the cursor is. Handy for seeing types and error messages without reaching for the mouse!


<hr>

# VSCode

- Ctrl + Shift + P(Command Palette)

```
>Preferences: Open User Settings (JSON)

or

Settings.JSON

```

# VScode ShortCut

```
// Quick Fix
⌘ + .
command + comma
// On the Mac, use the Command + . keys to pop up a menu of Quick Fix suggestions.
// On Windows, use the Ctrl + . keys.


// Go to Next Problem in Files(Error, Warning, Info) Go to next diagnostic (LSP) F8   다음
Tip: To loop through errors or warnings in the current file, you can press F8

// Go to Previous Problem in Files(Error, Warning, Info)Go to previous diagnostic (LSP) ⇧F8 이전 단계
⇧F8
Tip: To loop through errors or warnings in the current file, you can press

// Go to Symbol
⇧⌘O
You can navigate symbols inside a file with ⇧⌘O.


// Rename symbol
F2
Some languages support rename symbol across files. Press F2

// Trouble Toggle 창 처럼 요약된거 보기
⇧⌘M 
You can click on the summary or press ⇧⌘M 
```

- Quick Fix https://stackoverflow.com/questions/47287367/what-is-the-keyboard-shortcut-in-visual-studio-code-to-pop-up-the-quick-fix-menu

- Go to Symbol https://code.visualstudio.com/docs/editor/editingevolved

# Vim(VSCODE) & 주로 쓰는 vim key를 VSCode에 적용시키기

```
// 난 스페이스를 leader로 세팅해서 space 2x + e  하면 내가 원하는 문자 끝으로 한번에 ㅎ
<leader><leader>e end of words


// gh 빔에서 K 눌러서 문서 보는거 됨. 굿
gh Equivalent to hovering the mouse over a bit of text.

// 이거 Settings.JSON 에서 수정함. vim처럼 K 하면 문서나옴.
{
"vim.normalModeKeyBindings": [
    {
      "before": [
        "K"
      ],
      "after": [
        "g",
        "h"
      ]
    },
    {
      "before": [
        "H"
      ],
      "after": [
        "g",
        "T"
      ]
    },
    {
      "before": [
        "L"
      ],
      "after": [
        "g",
        "t"
      ]
    },
}
```

https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet/


# ESLint

- Integrates ESLint JavaScript into VS Code.

  https://eslint.org/docs/latest/use/getting-started

<hr>

# 내 vim setting(VScode)

```json
{
  // https://github.com/VSCodeVim/Vim
  // vim setting ~~~~
  "vim.leader":"<space>",
  "vim.useSystemClipboard": true,
  "editor.lineNumbers": "relative",
  "vim.easymotion": true,
  "vim.surround": true,
  "vim.insertModeKeyBindings": [
    {
      "before": ["j","k"],
      "after":["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": [
        "<leader>",
        ":"
      ],
      "commands": [
          "workbench.action.showCommands"
      ]
    },
    {
      "before": [
        "]",
        "d"
      ],
      "commands": [
        "editor.action.marker.nextInFiles"
      ]
    },
    {
      "before": [
        "[",
        "d"
      ],
      "commands": [
        "editor.action.marker.prevInFiles"
      ]
    },
    {
      "before": [
        "g",
        "a"
      ],
      "commands": [
        "editor.action.quickFix"
      ]
    },
    {
      "before": [
        "<leader>",
        "v"
      ],
      "commands": [
        "workbench.action.gotoSymbol"
      ]
    },
    {
      "before": [
        "<leader>",
        "t"
      ],
      "commands": [
        "workbench.actions.view.problems"
      ]
    },
    {
      "before": [
        "<leader>",
        "r"
      ],
      "commands": [
        "editor.action.rename"
      ]
    },
    {
      "before": [
        "<leader>",
        "x"
      ],
      "commands": [
        "workbench.action.closePanel"
      ]
    },
    {
      "before": [
        "<leader>",
        "m"
      ],
      "commands": [
        "bookmarks.toggle"
      ]
    },
    {
      "before": [
        "<leader>",
        "b"
      ],
      "commands": [
        "bookmarks.list"
      ]
    }
  ],
  "vim.handleKeys": {
    "<C-a>": true,
    "<C-b>": true,
    "<C-c>": false,
    "<C-d>": true,
    "<C-f>": true,
    "<C-h>": false,
    "<C-k>": false,
    "<C-r>": true,
    "<C-u>": false,
    "<C-v>": true,
    "<C-x>": true
  },
}
```
