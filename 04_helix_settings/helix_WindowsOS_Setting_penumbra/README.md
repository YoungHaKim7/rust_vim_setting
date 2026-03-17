# setting위치

```bash
$ echo $Env:AppData
C:\Users\ytok1\AppData\Roaming
```

# choco 로  Helix 23.03버젼 안 나와서 scoop패키지로 받기

- helix (A post-modern modal text editor)

🔗 https://helix-editor.com

📜 App manifest

Current version: 23.03

Bucket: main

License: MPL-2.0
Installation

```
scoop install helix
```

scoop 패키지 다운받는 법

https://scoop.sh/

https://github.com/ScoopInstaller/Install#readme

<br>

<hr>

# Rust - analyzer


https://rust-analyzer.github.io/

https://github.com/rust-lang/rust-analyzer

https://rust-analyzer.github.io/manual.html#installation

```
rustup component add rust-src
```

# rustup(이게 젤 좋은듯)

- https://rust-analyzer.github.io/manual.html#rustup

  - rust-analyzer is available in rustup:

```
$ rustup component add rust-analyzer
```

However, in contrast to component add clippy or component add rustfmt, this does not actually place a rust-analyzer binary in ~/.cargo/bin, see this issue. You can find the path to the binary using:

- rust-analyzer.exe가 어디에 설치 되어있는지 알수 있다.!

```
$ rustup which --toolchain stable rust-analyzer
```

You can link to there from ~/.cargo/bin or configure your editor to use the full path.

Alternatively you might be able to configure your editor to start rust-analyzer using the command:


```
$ rustup run stable rust-analyzer
```

  -  rust-analyzer.exe 있는 폴더 찾아서 PATH 잡아주면 끝 👍💻
