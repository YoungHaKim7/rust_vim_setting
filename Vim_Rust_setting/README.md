# Dotfiles

https://gitlab.com/dwt1/dotfiles

<br>

# CocConfig(vim)

```
{
  // rust-analyzer setting~
  "diagnostic.enable": true,
  "diagnostic.virtualText": true,
  "diagnostic.joinMessageLines": true,
  "diagnostic.checkCurrentLine": true,
  "diagnostic.messageTarget": "float",
  "diagnostic.level": "information",
  "suggest.autoTrigger": "none",
  "signature.enable": true,
  "coc.preferences.snippets.enable": true,
  "rust-analyzer.diagnostics.enable": true, 
  "rust-analyzer.inlayHints.enable": true,
  "rust-analyzer.inlayHints.chainingHints": true,
  "rust-analyzer.inlyHints.parameterHints": true,
  "rust-analyzer.cargo.loadOutDirsFromCheck": true,
  "rust-analyzer.procMacro.enable": true,

  "languageserver": {
     "csharp-ls": {
          "command": "csharp-ls",
          "filetypes": ["cs"],
          "rootPatterns": ["*.csproj", ".vim/", ".git/", ".hg/"]
        },
    "ada": {
      "settings": {
        "ada": {
          "projectFile": "gnat/vss_text.gpr"
        }
      },
      "command": "<path>/ada_language_server",
      "filetypes": [
        "ads",
        "adb",
        "ada"
      ]
    }
  },
  "coc.preferences.extensionUpdateCheck": "daily"

}
```


# :CocCommand



# CocCommand 다음 FUZZY> rust-analyer.viewHir View Hir 입력

- Rust code

```rust
pub static FOO: () = unsafe {
    let illegal_ptr2int: usize = std::mem::transmute(&());
    let _copy = illegal_ptr2int;
};
fn main() {
    println!("Hello, world!");
    println!();
}

```

<br>

<hr>

- Hir 보기


```

static FOO = unsafe {
    let illegal_ptr2int: usize = std::mem::transmute(
        &(),
    );
    let _copy = illegal_ptr2int;
};
```
