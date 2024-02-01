# Tabby AI(Coding Assistant)
- About
  - Self-hosted AI coding assistant


- https://github.com/TabbyML/tabby
- macos
```
brew install tabbyml/tabby/tabby

# Start server with StarCoder-1B
tabby serve --device metal --model TabbyML/StarCoder-1B
```

# lvim 쓸 때 ```cargo fmt && cargo check``` 활용하자

```bash
$ cargo fmt && cargo check
```

- inlayhint 색깔 hex color (LunarVim Inlayhint Color Settings)

```bash
// 요즘 쓰는 색 240106
:hi Comment guifg=#35638f guibg=#420517

// 배경은 어두운 빨간색 /  글씨는 약간 밝은 색
:hi Comment guifg=#8aaecf guibg=#4e1a1a
```



<hr>

# lvim-config_gyoung

1. install
https://www.lunarvim.org/

2. .config/lvim 세팅

# 이거 원래 주인 영상 My Development Setup (Neovim, Tmux, Alacritty & Rust-based CLI Tools)

https://youtu.be/stCXFxC4OH0


# Fork Github & Thank you.

https://github.com/adibhanna/lvim-config

# zig lang setting 난중에 적용할 예정

https://github.com/NTBBloodbath/zig-tools.nvim


# Todo
- [x] Apply jk as esc
  - /lua/user/keymaps.lua
  - ```
    lvim.keys.insert_mode["jk"] = "<Esc>"
    ```
- [x] Apply Relative Number
  - /lua/user/option.lua
  - ```
    local options = {
        relativenumber = true, -- set relative numbered lines
    }
    ``` 
- [x] Apply colorscheme
  - - /lua/user/option.lua
  - ```
    -- lvim.colorscheme = "tokyonight-moon"
    -- lvim.colorscheme = "gruvbox-material"
    lvim.colorscheme = "habamax"
    ``` 

- [x] Rust fmt Setting()

  - https://github.com/rust-lang/rust.vim
  - The perfect Neovim setup for Rust. https://youtu.be/mh_EJhH49Ms

    - /lua/user/plugins.lua
    ```bash
    -- cargo fmt
      {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
          vim.g.rustfmt_autosave = 1
        end
      },

    ```

- [ ] zig-tools (lsp) will be applied.

  - todo!()

