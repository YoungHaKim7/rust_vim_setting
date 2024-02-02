# UltiSnips

- UltiSnips is the ultimate solution for snippets in Vim.

- https://github.com/SirVer/ultisnips 

```bash
:help UltiSnips

```

- https://www.sirver.net/blog/2012/01/08/second-episode-of-ultisnips-screencast/

- 한글로 ultisnips정리
  - https://johngrib.github.io/wiki/vim/ultisnips/

- Rust Snippets 정리중(내가 공부하려고 정리중)

  - https://github.com/YoungHaKim7/UltiSnips
  - https://github.com/YoungHaKim7/rust_vim_setting/tree/main/01_Vim_NeoVim_etc_Rust_settings/snippets_Lunar_NeoVim
  - https://github.com/YoungHaKim7/rust-snippets_gyoung


# Coc-Settings.json

- https://johngrib.github.io/wiki/rust/vim-setting/

- https://stackoverflow.com/questions/77214955/coc-rust-analyzer-does-not-have-inlay-type-hint-anymore

```json
{
    "suggest.detailField": "abbr",
    "suggest.enablePreview": false,
    "coc.preferences.formatOnSaveFiletypes": [
        "markdown",
        "rust"
    ],
    "suggest.noselect": true,
    "rust-analyzer.inlayHints.typeHints.enable": true,
    "rust-analyzer.inlayHints.chainingHints.enable": true,
    "languageserver": {
        "golang": {
            "command": "gopls",
            "rootPatterns": [
                "go.mod",
                ".vim/",
                ".git/",
                ".hg/"
            ],
            "filetypes": [
                "go"
            ]
        }
    }
}

```

# :CocInstall coc-rust-analyzer

# :CocDiagnostics

# :CocConfig
- https://github.com/neoclide/coc.nvim/blob/master/doc/coc-config.txt

# :CocOutline(:Vista와 비슷)
