# Vim Setting (type 빨강색으로 강조하기 칙칙한 검은색 너무 싫다.)
-vim 에서

```
:hi CocInlayHint ctermbg=125

5 밝다
52 어둡다
```


- 내가 원하는 색깔 256 컬러에서 고르자 ㅎㅎ

https://www.ditig.com/256-colors-cheat-sheet


- 한글러스트Rust강의_048⭐️Rust개발환경Vim세팅하기_Vim_macOS_M1_pro #vim #CocInlayHint #rustinlayhint

https://youtu.be/gIUOkdMjo8o

# vim 안에서 (:CocConfig)

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
  }

}

```

<hr>

<br>

# 단서 (YouCompleteMe unavailable: unable to load Python)

https://stackoverflow.com/questions/61240101/youcompleteme-unavailable-unable-to-load-python

<br>


# 모든 언어를 무료로 공부할 수 있다.
출처 : stackoverflow.com 알게 된 링크

역시 갓 스택 오버플로우

https://stackoverflow.com/questions/38683512/why-git-shallow-clone-can-have-more-commits-than-depth/38683775#38683775

Github 주소
https://github.com/EbookFoundation/free-programming-books

EbookFoundation
https://ebookfoundation.github.io/free-programming-books/

