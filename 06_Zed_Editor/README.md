<p align="center">
    <img width=90px src="https://github.com/YoungHaKim7/Cpp_Training/assets/67513038/2f7edcb7-3372-4ea7-b4e8-cea1c451c943" />
    <br>Code at the speed of thought

<br>[Zed](https://zed.dev/) is a high-performance, multiplayer code editor from the creators of Atom and Tree-sitter. It's also open source.
</p>

# link
- [vim필요한 기능 추가할때 볼 API네임 잘 정리됨(all-actions)](https://zed.dev/docs/all-actions?highlight=find%20files#all-actions)
- [fix고친거 || 고쳐야 할것](#fix)
- [Zed에 기본 세팅된 vim keymap](#vimjson)
  - [zed vimdefault key setting(vim.json)여기 참조](https://github.com/zed-industries/zed/blob/v0.144.3/assets/keymaps/vim.json)
- [많이-쓰는-키key정리](#많이-쓰는-키key정리)
- [zed releases최신버젼체크](#zed-releases버젼업최신-버젼체크)
  - https://zed.dev/blog
  - [zed의 기가막힌 기능들_최신 업데이트 소식 등등](#zed의-기가막힌-기능들)
    - [250619드디어 디버깅 된다 https://zed.dev/debugger](https://zed.dev/debugger)
      - 블로그 글 https://zed.dev/blog/debugger
    - [zed Blog에 최신기능과 구현 방법 좋은 글 많음](https://zed.dev/blog)
- [zed Install설치하기 linux & macOS 가능241111](#zedinstall-__-brew-install)
- [zed-doc_tutorial문서](#zed-doctutorial문서)
  - [Zed Debugger디버깅하는 법](#zed-debugger디버깅하는-법) 
  - [터미널창 우측에 크게 띄우기 The Dock부분 확인하면됨(VSCode에서의 "Terminal : Create New terminal in Editor Area to the Side"](https://zed.dev/features)
- snippets설정
  - 여기에 러스트 json정리함
    - https://github.com/YoungHaKim7/snippets_Lunar_NeoVim
  - [zed에 snippets설정하기](https://zed.dev/docs/languages/rust)
  - [https://zed.dev/docs/snippets](https://zed.dev/docs/snippets)
    - [서버설정..https://github.com/zed-industries/simple-completion-language-server](https://github.com/zed-industries/simple-completion-language-server)
- [git blame안하오게 세팅](#git-blame안-나오게-세팅)
- [zed extension만들어서 기여하기](https://zed.dev/docs/extensions/developing-extensions)
  - [여기에 repo올려야함.https://github.com/zed-industries/extensions](https://github.com/zed-industries/extensions)

- zed extension쓸만한거 모음
  - https://github.com/zed-extensions/postgres-context-server/
  - https://github.com/jackTabsCode/zed-just
  - https://github.com/zed-extensions/zig

- [scm파일로 관리하네..The_Scheme Programming알아보기](https://www.scheme.org/)

- AI 세팅
  - [Copilot logout겁나게 느린 코파일럿 로그아웃으로 꺼지게 하자 ㅋㅋ](#copilot-logout겁나게-느린-코파일럿-로그아웃으로-꺼지게-하자-ㅋㅋ)
  - [zed에 TabbyAI를 연결할 단서1_https://github.com/d1y/tabby-agent-zed](https://github.com/d1y/tabby-agent-zed)
    - [zed에 TabbyAI를 연결할 단서2](https://github.com/zed-industries/zed/issues/4421)

- C/C++ 설정관련
  - [Zed C/C++ tabsize 설정 4칸으로 하는 방법](#zed-cc-tabsize-설정-4칸으로-하는-방법)

- 다른 외국인 zed setting
  - https://github.com/jeremychone/jc-zed-config

<hr>

# Copilot logout겁나게 느린 코파일럿 로그아웃으로 꺼지게 하자 ㅋㅋ[|🔝|](#link)
- https://github.com/zed-industries/zed/issues/19545

```
❯ copilot: sign out
```

- copilot  추천한거 승인하기( zed ver. Zed 0.199.6)

```json
{
  "context": "Editor && inline_completion && !showing_completions",
  "bindings": {
    "tab": "editor::Tab",
    "ctrl-b": "editor::AcceptEditPrediction"
  }
},
```

# Codestral (MistralAI) can now be used as your provider for edit predictions.[|🔝|](#link)
- zed. v.0209나옴
  - Thanks dvcrn!
​
```json
"features": {
"edit_prediction_provider": "codestral"
}
```

# Zed C/C++ tabsize 설정 4칸으로 하는 방법[|🔝|](#link)
- https://zed.dev/docs/languages/cpp

```json
  "languages": {
    "C++": {
      "format_on_save": "on",
      "tab_size": 4
    },
    "C": {
      "format_on_save": "on",
      "tab_size": 4
    }
  }

```


# Zed Debugger디버깅하는 법[|🔝|](#link)

- https://zed.dev/docs/debugger

<hr />

# 줄간격 조절
- https://github.com/zed-industries/zed/issues/5590

# Mini맵 나오게 세팅(최신기능)[|🔝|](#link)

- https://zed.dev/docs/configuring-zed#minimap

```json
{
  "minimap": {
    "show": "never",
    "thumb": "always",
    "thumb_border": "left_open",
    "current_line_highlight": null
  }
}
```


# git blame안 나오게 세팅[|🔝|](#link)

```json
 "git": {
    "inline_blame": {
      "enabled": false
    }
  },
```

- setting.json(Git 나오는거 안나오게)

```json
"git": {
  "git_gutter": "tracked_files",
  "inline_blame": {
    "enabled": false
  }
}
```

- 출처 : https://github.com/zed-industries/zed/discussions/11279

# setting문서 설명서 잘 정리됨[|🔝|](#link)
- https://zed.dev/docs/configuring-zed

# 많이 쓰는 키key정리[|🔝|](#link)

```
gs   많이 씀 Find symbol in curren file


// Comment
"space g c": "editor::ToggleComments"

// cargo expand
"g m": "editor::ExpandMacroRecursively"

// 창 좌우로 나누기
:vs

// 창 상하단으로 나누기
:sp

// 창이동(normal mode)
<C-w>h    or  l


// toml같은거 a~z순으로 정렬 시키기 굿
:sort
 editor: sort lines case sensitive
```

- sort https://github.com/zed-industries/zed/issues/8683

- 내가 세팅한거

```json

[
  {
    "context": "Editor && VimControl && !VimWaiting && !menu",
    "bindings": {
      // put key-bindings here if you want them to work in normal & visual mode
    }
  },
  {
    "context": "Editor && vim_mode == normal && !VimWaiting && !menu",
    "bindings": {
      // put key-bindings here if you want them to work only in normal mode
      // ~~~~~~~ Normal Mode
      // Doc hover
      "K": "editor::Hover",
      // buffer :bn :bp
      "L": "pane::ActivateNextItem",
      "H": "pane::ActivatePrevItem",
      // quick fix
      "space g a": "editor::ToggleCodeActions",
      "] d": "editor::GoToDiagnostic",
      "[ d": "editor::GoToPrevDiagnostic",
      "g m": "editor::ExpandMacroRecursively",
      // LSP rename    "ga" multi cursor
      "space r": "editor::Rename",
      // symbol search   "gs"
      "space o": "project_symbols::Toggle",
      // NERDTree
      "space e": "project_panel::ToggleFocus",
      "space x": "workspace::CloseAllDocks",
      // Terminal Pannel(shell)
      "space s h": "terminal_panel::ToggleFocus",
      // trouble toggle
      "space t": "diagnostics::Deploy"
    }
  },
  {
    "context": "Editor && vim_mode == visual && !VimWaiting && !menu",
    "bindings": {
      // visual, visual line & visual block modes
      // ~~~~~~ Visual Mode
      "K": "editor::MoveLineUp",
      "J": "editor::MoveLineDown",
      "space g c": "editor::ToggleComments"
    }
  },
  {
    "context": "Editor && vim_mode == insert && !menu",
    "bindings": {
      // put key-bindings here if you want them to work in insert mode
      // ~~~~~~ Insert Mode
      "j k": ["vim::SwitchMode", "Normal"]
    }
  },
  {
    "context": "Editor && vim_mode == insert && menu",
    "bindings": {
      // put key-bindings here if you want them to work in insert mode
      // ~~~~~~ Insert Mode
      "j k": ["vim::SwitchMode", "Normal"]
    }
  },
  {
    "context": "ProjectPanel",
    "bindings": {
      "h": "project_panel::CollapseSelectedEntry",
      "l": "project_panel::ExpandSelectedEntry",
      "j": "menu::SelectNext",
      "k": "menu::SelectPrev",
      "o": "menu::Confirm",
      "r": "project_panel::Rename",
      "z c": "project_panel::CollapseSelectedEntry",
      "z o": "project_panel::ExpandSelectedEntry",
      "shift-o": "project_panel::RevealInFinder",
      "x": "project_panel::Cut",
      "c": "project_panel::Copy",
      "p": "project_panel::Paste",
      "d": "project_panel::Delete",
      "a": "project_panel::NewFile",
      "shift-a": "project_panel::NewDirectory",
      "shift-y": "project_panel::CopyRelativePath",
      "g y": "project_panel::CopyPath"
    }
  }
]

```

- vim 기본 내장된건(zed vim mode)[[🔝]](#link)
```
# Normal mode
g d   Go to definition
g D   Go to type definition
c d   Rename (change definition)
g A   Go to All references to the current word

g <space>  Open the current search excerpt in its own tab

g s   Find symbol in current file
g S   Find symbol in entire project

g n   Add a visual selection for the next copy of the current word
g N   The same, but backwards
g >   Skip latest word selection, and add next.
g <   The same, but backwards
g a   Add a visual selection for every copy of the current word

g h   Show inline error (hover)

# Insert mode
ctrl-x ctrl-o  Open the completion menu
ctrl-x ctrl-c  Request GitHub Copilot suggestion (if configured)
ctrl-x ctrl-a  Open the inline AI assistant (if configured)
ctrl-x ctrl-l  Open the LSP code actions
ctrl-x ctrl-z  Hides all suggestions

# Ex commands (as of zed 0.124.0)
:E[xplore]    Open the project panel
:C[ollab]     Open the collaboration panel
:Ch[at]       Open the chat panel
:A[I]         Open the AI panel
:No[tif]      Open the notifications panel
:fe[edback]   Open the feedback window
:cl[ist]      Open the diagnostics window
:te[rm]       Open the terminal
:Ext[ensions] Open the extensions window
```
- https://zed.dev/docs/vim

- NERDTree쪽 키 추가하기

  - https://github.com/zed-industries/zed/issues/4753

```json
  {
    "context": "ProjectPanel",
    "bindings": {
      "h": "project_panel::CollapseSelectedEntry",
      "l": "project_panel::ExpandSelectedEntry",
      "j": "menu::SelectNext",
      "k": "menu::SelectPrev",
      "o": "menu::Confirm",
      "r": "project_panel::Rename",
      "z c": "project_panel::CollapseSelectedEntry",
      "z o": "project_panel::ExpandSelectedEntry",
      "shift-o": "project_panel::RevealInFinder",
      "x": "project_panel::Cut",
      "c": "project_panel::Copy",
      "p": "project_panel::Paste",
      "d": "project_panel::Delete",
      "a": "project_panel::NewFile",
      "shift-a": "project_panel::NewDirectory",
      "shift-y": "project_panel::CopyRelativePath",
      "g y": "project_panel::CopyPath"
    }
  }

```

# Fix[|🔝|](#link)

- [ ] copilot 승인하고 normal "o" 먹통
  - 이렇게 해도 안됨. 

```json
{
    "context": "Editor && vim_mode == normal && !VimWaiting && !(edit_prodiction || showing_completions)",
    "bindings": {
      "o": [
        "vim::InsertLineBelow",
        "vim::Down"
      ]
    }
  },
```


```json
 {
    "context": "Editor && vim_mode == insert && !menu",
    "bindings": {
      "j k": ["vim::SwitchMode", "Normal"]
    }
  }
```

- [x] 해결한 코드(jk딜레이 없이 바로 적용)
  - https://github.com/zed-industries/zed/discussions/6661

- [x] 자동 완성중에 jk입력 안되는거 해결함
  - https://github.com/zed-industries/zed/issues/8729

```json
  {
    "context": "Editor && vim_mode == insert && !menu",
    "bindings": {
      // put key-bindings here if you want them to work in insert mode
      // ~~~~~~ Insert Mode
      "j k": ["vim::SwitchMode", "Normal"]
    }
  },
  {
    "context": "Editor && vim_mode == insert && menu",
    "bindings": {
      // put key-bindings here if you want them to work in insert mode
      // ~~~~~~ Insert Mode
      "j k": ["vim::SwitchMode", "Normal"]
    }
  },
```

- [x] Replace 모드(R) 대문자R에서 jk 안 먹힘(추가해서 test예정
  - 단서2 https://github.com/zed-industries/zed/issues/14692

```json

 {
    "context": "Editor && vim_mode == replace",
    "bindings": {
      // put key-bindings here if you want them to work in Replace mode
      // ~~~~~~ Replace Mode
      "j k": [
        "vim::SwitchMode",
        "Normal"
      ]
    }
  },
```

<hr>

- [x] ctlr+y 자동완성 질문해서 해결함(추가로 세팅해서 해결)
  - 결국 물어봄 ㅠㅠ(해결완료)
    - https://github.com/zed-industries/zed/issues/8707

```json
{
// CofirmComletion
  {
    "context": "Editor && showing_completions",
    "bindings": {
      "ctrl-y": "editor::ConfirmCompletion"
    }
  },
```

- ">" "<" Visual mode에서 풀리는거 해결(visual에 >쓰고 repeat기능활용)
  - https://github.com/zed-industries/zed/issues/12351

```json
  {
    "context": "Editor && vim_mode == visual && !VimWaiting && !menu",
    "bindings": {
      // visual, visual line & visual block modes
      // ~~~~~~ Visual Mode
      "K": "editor::MoveLineUp",
      "J": "editor::MoveLineDown",
      "space g c": "editor::ToggleComments",
      ">": "vim::Indent",
      "<": "vim::Outdent"
    }
  },

  {
    "context": "Editor && vim_mode == normal && !VimWaiting && !menu",
    "bindings": {
      // put key-bindings here if you want them to work only in normal mode
      // ~~~~~~~ Normal Mode
      // Doc hover
      "K": "editor::Hover",
      // buffer :bn :bp
      "L": "pane::ActivateNextItem",
      "H": "pane::ActivatePrevItem",
      // quick fix
      "space g a": "editor::ToggleCodeActions",
      "] d": "editor::GoToDiagnostic",
      "[ d": "editor::GoToPrevDiagnostic",
      "g m": "editor::ExpandMacroRecursively",
      // LSP rename    "ga" multi cursor
      "space r": "editor::Rename",
      // symbol search   "gs"
      "space o": "project_symbols::Toggle",
      // NERDTree
      "space e": "project_panel::ToggleFocus",
      "space x": "workspace::CloseAllDocks",
      // Terminal Pannel(shell)
      "space s h": "terminal_panel::ToggleFocus",
      // Terminal :vs
      "space b t": "workspace::NewCenterTerminal",
      // trouble toggle
      "space t": "diagnostics::Deploy",
      ".": "vim::Repeat"
    }
  },

```

<hr>

- [x] 터미널 root열리는거 해결하는 힌트
  - zed터미널 루트에서 열리는거 해결하는 힌트1
    - https://zed.dev/docs/configuring-zed#terminal
- [x] 추가해 주니 해결됨 굿

```json
  "terminal": {
    "shell": "system",
    "working_directory": "current_project_directory"
  },
```

<hr />

- [x] auto close되게 세팅하기(Bracket matching)
  - https://zed.dev/docs/extensions/languages#bracket-matching

- [x] Bracket matching
  - The `brackets.scm` file defines matching brackets.
  - Here's an example from a brackets.scm file for JSON:

```scm
("[" @open "]" @close)
("{" @open "}" @close)
```


<hr />

# vim.json[|🔝|](#link)

- https://zed.dev/ref/vim.json
- https://github.com/zed-industries/zed/blob/main/assets/keymaps/vim.json

<hr>

# zed releases버젼업(최신 버젼체크)[[|🔝|](#link)

- https://zed.dev/releases/stable

# Zed Doc(tutorial문서)[|🔝|](#link)
- https://zed.dev/docs/getting-started

# Zed Vim[|🔝|](#link)

- https://docs.zed.dev/general/vim

# Zed(install) __ Brew Install[|🔝|](#link)

- https://zed.dev/
- https://formulae.brew.sh/cask/zed
- https://docs.zed.dev/general/readme


- settings.json  필요한것만 골라서 수정하면 된다.
```json
{
  // The name of the Zed theme to use for the UI
  "theme": "One Dark",
  // The name of a base set of key bindings to use.
  // This setting can take four values, each named after another
  // text editor:
  //
  // 1. "VSCode"
  // 2. "JetBrains"
  // 3. "SublimeText"
  // 4. "Atom"
  "base_keymap": "VSCode",
  // Features that can be globally enabled or disabled
  "features": {
    // Show Copilot icon in status bar
    "copilot": true
  },
  // The name of a font to use for rendering text in the editor
  "buffer_font_family": "Zed Mono",
  // The OpenType features to enable for text in the editor.
  "buffer_font_features": {
    // Disable ligatures:
    // "calt": false
  },
  // The default font size for text in the editor
  "buffer_font_size": 15,
  // Set the buffer's line height.
  // May take 3 values:
  //  1. Use a line height that's comfortable for reading (1.618)
  //         "line_height": "comfortable"
  //  2. Use a standard line height, (1.3)
  //         "line_height": "standard",
  //  3. Use a custom line height
  //         "line_height": {
  //           "custom": 2
  //         },
  "buffer_line_height": "comfortable",
  // The name of a font to use for rendering text in the UI
  "ui_font_family": "Zed Mono",
  // The OpenType features to enable for text in the UI
  "ui_font_features": {
    // Disable ligatures:
    "calt": false
  },
  // The default font size for text in the UI
  "ui_font_size": 16,
  // The factor to grow the active pane by. Defaults to 1.0
  // which gives the same size as all other panes.
  "active_pane_magnification": 1.0,
  // Whether to enable vim modes and key bindings
  "vim_mode": true,
  // Whether to show the informational hover box when moving the mouse
  // over symbols in the editor.
  "hover_popover_enabled": true,
  // Whether to confirm before quitting Zed.
  "confirm_quit": false,
  // Whether the cursor blinks in the editor.
  "cursor_blink": true,
  // Whether to pop the completions menu while typing in an editor without
  // explicitly requesting it.
  "show_completions_on_input": true,
  // Whether to display inline and alongside documentation for items in the
  // completions menu
  "show_completion_documentation": true,
  // Whether to show wrap guides in the editor. Setting this to true will
  // show a guide at the 'preferred_line_length' value if softwrap is set to
  // 'preferred_line_length', and will show any additional guides as specified
  // by the 'wrap_guides' setting.
  "show_wrap_guides": true,
  // Character counts at which to show wrap guides in the editor.
  "wrap_guides": [],
  // Whether to use additional LSP queries to format (and amend) the code after
  // every "trigger" symbol input, defined by LSP server capabilities.
  "use_on_type_format": true,
  // Controls whether copilot provides suggestion immediately
  // or waits for a `copilot::Toggle`
  "show_copilot_suggestions": true,
  // Whether to show tabs and spaces in the editor.
  // This setting can take two values:
  //
  // 1. Draw tabs and spaces only for the selected text (default):
  //    "selection"
  // 2. Do not draw any tabs or spaces:
  //   "none"
  // 3. Draw all invisible symbols:
  //   "all"
  "show_whitespaces": "selection",
  // Settings related to calls in Zed
  "calls": {
    // Join calls with the microphone muted by default
    "mute_on_join": false
  },
  // Scrollbar related settings
  "scrollbar": {
    // When to show the scrollbar in the editor.
    // This setting can take four values:
    //
    // 1. Show the scrollbar if there's important information or
    //    follow the system's configured behavior (default):
    //   "auto"
    // 2. Match the system's configured behavior:
    //    "system"
    // 3. Always show the scrollbar:
    //    "always"
    // 4. Never show the scrollbar:
    //    "never"
    "show": "auto",
    // Whether to show git diff indicators in the scrollbar.
    "git_diff": true,
    // Whether to show selections in the scrollbar.
    "selections": true
  },
  "relative_line_numbers": true,
  // When to populate a new search's query based on the text under the cursor.
  // This setting can take the following three values:
  //
  // 1. Always populate the search query with the word under the cursor (default).
  //    "always"
  // 2. Only populate the search query when there is text selected
  //    "selection"
  // 3. Never populate the search query
  //    "never"
  "seed_search_query_from_cursor": "always",
  // Inlay hint related settings
  "inlay_hints": {
    // Global switch to toggle hints on and off, switched off by default.
    "enabled": true,
    // Toggle certain types of hints on and off, all switched on by default.
    "show_type_hints": true,
    "show_parameter_hints": true,
    // Corresponds to null/None LSP hint type value.
    "show_other_hints": true
  },
  "project_panel": {
    // Default width of the project panel.
    "default_width": 240,
    // Where to dock project panel. Can be 'left' or 'right'.
    "dock": "left",
    // Whether to show file icons in the project panel.
    "file_icons": true,
    // Whether to show folder icons or chevrons for directories in the project panel.
    "folder_icons": true,
    // Whether to show the git status in the project panel.
    "git_status": true,
    // Amount of indentation for nested items.
    "indent_size": 20,
    // Whether to reveal it in the project panel automatically,
    // when a corresponding project entry becomes active.
    // Gitignored entries are never auto revealed.
    "auto_reveal_entries": true
  },
  "collaboration_panel": {
    // Whether to show the collaboration panel button in the status bar.
    "button": true,
    // Where to dock channels panel. Can be 'left' or 'right'.
    "dock": "left",
    // Default width of the channels panel.
    "default_width": 240
  },
  "chat_panel": {
    // Whether to show the collaboration panel button in the status bar.
    "button": true,
    // Where to dock channels panel. Can be 'left' or 'right'.
    "dock": "right",
    // Default width of the channels panel.
    "default_width": 240
  },
  "notification_panel": {
    // Whether to show the collaboration panel button in the status bar.
    "button": true,
    // Where to dock channels panel. Can be 'left' or 'right'.
    "dock": "right",
    // Default width of the channels panel.
    "default_width": 380
  },
  "assistant": {
    // Whether to show the assistant panel button in the status bar.
    "button": true,
    // Where to dock the assistant. Can be 'left', 'right' or 'bottom'.
    "dock": "right",
    // Default width when the assistant is docked to the left or right.
    "default_width": 640,
    // Default height when the assistant is docked to the bottom.
    "default_height": 320,
    // The default OpenAI model to use when starting new conversations. This
    // setting can take two values:
    //
    // 1. "gpt-3.5-turbo-0613""
    // 2. "gpt-4-0613""
    // 3. "gpt-4-1106-preview"
    "default_open_ai_model": "gpt-4-1106-preview"
  },
  // Whether the screen sharing icon is shown in the os status bar.
  "show_call_status_icon": true,
  // Whether to use language servers to provide code intelligence.
  "enable_language_server": true,
  // When to automatically save edited buffers. This setting can
  // take four values.
  //
  // 1. Never automatically save:
  //     "autosave": "off",
  // 2. Save when changing focus away from the Zed window:
  //     "autosave": "on_window_change",
  // 3. Save when changing focus away from a specific buffer:
  //     "autosave": "on_focus_change",
  // 4. Save when idle for a certain amount of time:
  //     "autosave": { "after_delay": {"milliseconds": 500} },
  "autosave": "off",
  // Settings related to the editor's tabs
  "tabs": {
    // Show git status colors in the editor tabs.
    "git_status": false,
    // Position of the close button on the editor tabs.
    "close_position": "right"
  },
  // Whether or not to remove any trailing whitespace from lines of a buffer
  // before saving it.
  "remove_trailing_whitespace_on_save": true,
  // Whether to start a new line with a comment when a previous line is a comment as well.
  "extend_comment_on_newline": true,
  // Whether or not to ensure there's a single newline at the end of a buffer
  // when saving it.
  "ensure_final_newline_on_save": true,
  // Whether or not to perform a buffer format before saving
  "format_on_save": "on",
  // How to perform a buffer format. This setting can take 4 values:
  //
  // 1. Format code using the current language server:
  //     "formatter": "language_server"
  // 2. Format code using an external command:
  //     "formatter": {
  //       "external": {
  //         "command": "prettier",
  //         "arguments": ["--stdin-filepath", "{buffer_path}"]
  //       }
  //     }
  // 3. Format code using Zed's Prettier integration:
  //     "formatter": "prettier"
  // 4. Default. Format files using Zed's Prettier integration (if applicable),
  //    or falling back to formatting via language server:
  //     "formatter": "auto"
  "formatter": "auto",
  // How to soft-wrap long lines of text. This setting can take
  // three values:
  //
  // 1. Do not soft wrap.
  //      "soft_wrap": "none",
  // 2. Soft wrap lines that overflow the editor:
  //      "soft_wrap": "editor_width",
  // 3. Soft wrap lines at the preferred line length
  //      "soft_wrap": "preferred_line_length",
  "soft_wrap": "none",
  // The column at which to soft-wrap lines, for buffers where soft-wrap
  // is enabled.
  "preferred_line_length": 80,
  // Whether to indent lines using tab characters, as opposed to multiple
  // spaces.
  "hard_tabs": false,
  // How many columns a tab should occupy.
  "tab_size": 4,
  // Control what info is collected by Zed.
  "telemetry": {
    // Send debug info like crash reports.
    "diagnostics": true,
    // Send anonymized usage data like what languages you're using Zed with.
    "metrics": true
  },
  // Automatically update Zed
  "auto_update": true,
  // Diagnostics configuration.
  "diagnostics": {
    // Whether to show warnings or not by default.
    "include_warnings": true
  },
  // Add files or globs of files that will be excluded by Zed entirely:
  // they will be skipped during FS scan(s), file tree and file search
  // will lack the corresponding file entries.
  "file_scan_exclusions": [
    "**/.git",
    "**/.svn",
    "**/.hg",
    "**/CVS",
    "**/.DS_Store",
    "**/Thumbs.db",
    "**/.classpath",
    "**/.settings"
  ],
  // Git gutter behavior configuration.
  "git": {
    // Control whether the git gutter is shown. May take 2 values:
    // 1. Show the gutter
    //      "git_gutter": "tracked_files"
    // 2. Hide the gutter
    //      "git_gutter": "hide"
    "git_gutter": "tracked_files"
  },
  "copilot": {
    // The set of glob patterns for which copilot should be disabled
    // in any matching file.
    "disabled_globs": [
      ".env"
    ]
  },
  // Settings specific to journaling
  "journal": {
    // The path of the directory where journal entries are stored
    "path": "~",
    // What format to display the hours in
    // May take 2 values:
    // 1. hour12
    // 2. hour24
    "hour_format": "hour12"
  },
  // Settings specific to the terminal
  "terminal": {
    // What shell to use when opening a terminal. May take 3 values:
    // 1. Use the system's default terminal configuration in /etc/passwd
    //      "shell": "system"
    // 2. A program:
    //      "shell": {
    //        "program": "sh"
    //      }
    // 3. A program with arguments:
    //     "shell": {
    //         "with_arguments": {
    //           "program": "/bin/bash",
    //           "arguments": ["--login"]
    //         }
    //     }
    "shell": "system",
    // Where to dock terminals panel. Can be 'left', 'right', 'bottom'.
    "dock": "bottom",
    // Default width when the terminal is docked to the left or right.
    "default_width": 640,
    // Default height when the terminal is docked to the bottom.
    "default_height": 320,
    // What working directory to use when launching the terminal.
    // May take 4 values:
    // 1. Use the current file's project directory.  Will Fallback to the
    //    first project directory strategy if unsuccessful
    //      "working_directory": "current_project_directory"
    // 2. Use the first project in this workspace's directory
    //      "working_directory": "first_project_directory"
    // 3. Always use this platform's home directory (if we can find it)
    //     "working_directory": "always_home"
    // 4. Always use a specific directory. This value will be shell expanded.
    //    If this path is not a valid directory the terminal will default to
    //    this platform's home directory  (if we can find it)
    //      "working_directory": {
    //        "always": {
    //          "directory": "~/zed/projects/"
    //        }
    //      }
    "working_directory": "current_project_directory",
    // Set the cursor blinking behavior in the terminal.
    // May take 4 values:
    //  1. Never blink the cursor, ignoring the terminal mode
    //         "blinking": "off",
    //  2. Default the cursor blink to off, but allow the terminal to
    //     set blinking
    //         "blinking": "terminal_controlled",
    //  3. Always blink the cursor, ignoring the terminal mode
    //         "blinking": "on",
    "blinking": "terminal_controlled",
    // Set whether Alternate Scroll mode (code: ?1007) is active by default.
    // Alternate Scroll mode converts mouse scroll events into up / down key
    // presses when in the alternate screen (e.g. when running applications
    // like vim or  less). The terminal can still set and unset this mode.
    // May take 2 values:
    //  1. Default alternate scroll mode to on
    //         "alternate_scroll": "on",
    //  2. Default alternate scroll mode to off
    //         "alternate_scroll": "off",
    "alternate_scroll": "off",
    // Set whether the option key behaves as the meta key.
    // May take 2 values:
    //  1. Rely on default platform handling of option key, on macOS
    //     this means generating certain unicode characters
    //         "option_to_meta": false,
    //  2. Make the option keys behave as a 'meta' key, e.g. for emacs
    //         "option_to_meta": true,
    "option_as_meta": false,
    // Whether or not selecting text in the terminal will automatically
    // copy to the system clipboard.
    "copy_on_select": false,
    // Any key-value pairs added to this list will be added to the terminal's
    // environment. Use `:` to separate multiple values.
    "env": {
      // "KEY": "value1:value2"
    },
    // Set the terminal's line height.
    // May take 3 values:
    //  1. Use a line height that's comfortable for reading, 1.618
    //         "line_height": "comfortable"
    //  2. Use a standard line height, 1.3. This option is useful for TUIs,
    //      particularly if they use box characters
    //         "line_height": "standard",
    //  3. Use a custom line height.
    //         "line_height": {
    //           "custom": 2
    //         },
    "line_height": "comfortable",
    // Activate the python virtual environment, if one is found, in the
    // terminal's working directory (as resolved by the working_directory
    // setting). Set this to "off" to disable this behavior.
    "detect_venv": {
      "on": {
        // Default directories to search for virtual environments, relative
        // to the current working directory. We recommend overriding this
        // in your project's settings, rather than globally.
        "directories": [
          ".env",
          "env",
          ".venv",
          "venv"
        ],
        // Can also be 'csh', 'fish', and `nushell`
        "activate_script": "default"
      }
    }
    // Set the terminal's font size. If this option is not included,
    // the terminal will default to matching the buffer's font size.
    // "font_size": "15",
    // Set the terminal's font family. If this option is not included,
    // the terminal will default to matching the buffer's font family.
    // "font_family": "Zed Mono",
    // ---
  },
  // Difference settings for semantic_index
  "semantic_index": {
    "enabled": true
  },
  // Settings specific to our elixir integration
  "elixir": {
    // Change the LSP zed uses for elixir.
    // Note that changing this setting requires a restart of Zed
    // to take effect.
    //
    // May take 3 values:
    //  1. Use the standard ElixirLS, this is the default
    //         "lsp": "elixir_ls"
    //  2. Use the experimental NextLs
    //         "lsp": "next_ls",
    //  3. Use a language server installed locally on your machine:
    //         "lsp": {
    //           "local": {
    //             "path": "~/next-ls/bin/start",
    //             "arguments": ["--stdio"]
    //            }
    //          },
    //
    "lsp": "elixir_ls"
  },
  // Different settings for specific languages.
  "languages": {
    "Plain Text": {
      "soft_wrap": "preferred_line_length"
    },
    "Elixir": {
      "tab_size": 2
    },
    "Go": {
      "tab_size": 4,
      "hard_tabs": true
    },
    "Markdown": {
      "soft_wrap": "preferred_line_length"
    },
    "JavaScript": {
      "tab_size": 2
    },
    "TypeScript": {
      "tab_size": 2
    },
    "TSX": {
      "tab_size": 2
    },
    "YAML": {
      "tab_size": 2
    },
    "JSON": {
      "tab_size": 2
    }
  },
  // Zed's Prettier integration settings.
  // If Prettier is enabled, Zed will use this its Prettier instance for any applicable file, if
  // project has no other Prettier installed.
  "prettier": {
    // Use regular Prettier json configuration:
    // "trailingComma": "es5",
    // "tabWidth": 4,
    // "semi": false,
    // "singleQuote": true
  },
  // LSP Specific settings.
  "lsp": {
    // Specify the LSP name as a key here.
    // "rust-analyzer": {
    //     //These initialization options are merged into Zed's defaults
    //     "initialization_options": {
    //         "checkOnSave": {
    //             "command": "clippy"
    //         }
    //     }
    // }
  }
}
```

# zed의 기가막힌 기능들[|🔝|](#link)
- [rainbow-brackets | Zed Has Rainbow Brackets | Kirill Bulatov | December 3rd, 2025](https://zed.dev/blog/rainbow-brackets)
- [Run Your Project in a Dev Container, in Zed | Danilo Leal | Kyle BartonInitial Capacity | Kyle Barton | January 7th, 2026](https://zed.dev/blog/dev-containers)
- [json붙어넣으면 자동으로 러스트 코드로 변환해줌 굿](https://x.com/zeddotdev/status/1781696053093212620)
- [이제 된다 굿 v0.209_Markdown preview with an HTML `img` tag]

- vim 관련
  - [유니코드 입력하기Added ctrl-v/ctrl-q to type any unicode code point. For example ctrl-v escape inserts an escape character(U+001B), or ctrl-v u 1 0 E 2 types ტ (U+10E2). As in vim ctrl-v ctrl-j inserts U+0000 not U+000A. Zed does not yet implement insertion of the vim-specific representation of the typed keystroke for other keystroke](https://zed.dev/releases/stable)

- AI 관련
  - [Added the ability to copy surrounding code blocks in the assistant panel into the clipboard, or inserting them directly into the editor, without manually selecting. Place cursor anywhere in a code block (marked by triple backticks) and use the assistant::CopyCode action (cmd-k c / ctrl-k c) to copy to the clipboard, or the assistant::InsertIntoEditor action (cmd-< / ctrl-<) to insert into editor (#17853; thanks thataboy)](https://zed.dev/releases/stable)

