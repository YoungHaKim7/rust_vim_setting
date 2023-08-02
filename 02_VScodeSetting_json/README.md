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

# Vim(VSCODE)

```
// gh 빔에서 K 눌러서 문서 보는거 됨. 굿
gh Equivalent to hovering the mouse over a bit of text.

// 난 스페이스를 leader로 세팅해서 space 2x + e  하면 내가 원하는 문자 끝으로 한번에 ㅎ
<leader><leader>e end of words
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
