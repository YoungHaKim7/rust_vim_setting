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

```
$ rustup which --toolchain stable rust-analyzer
```

You can link to there from ~/.cargo/bin or configure your editor to use the full path.

Alternatively you might be able to configure your editor to start rust-analyzer using the command:


```
$ rustup run stable rust-analyzer
```

  -  rust-analyzer.exe 있는 폴더 찾아서 PATH 잡아주면 끝 👍💻
