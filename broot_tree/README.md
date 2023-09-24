# Homepage

https://dystroy.org/broot/

# Github


https://github.com/Canop/broot


# Setting

- Running editor from xdg-open hangs broot #433 

https://github.com/Canop/broot/issues/433


- vscode font
  - https://dystroy.org/broot/icons/

# Install


- Broot installation

Once you have rust and dependencies installed, use cargo to install broot:

```
cargo install --locked broot
```


# ```broot``` 이렇게 누르면 실행된다.

- 다 설치 후에 ```broot``` 실행  

```
$ broot

Broot should be launched using a shell function.
This function most notably makes it possible to cd from inside broot
(see https://dystroy.org/broot/install-br/ for explanations).

Can I install it now? [Y/n]
y
Writing br shell function in /home/gy/.local/share/broot/launcher/bash/1.
Creating link from /home/gy/.config/broot/launcher/bash/br to /home/gy/.local/share/broot/launcher/bash/1.
/home/gy/.bashrc successfully patched, you can make the function immediately available with source /home/gy/.bashrc
/home/gy/.zshrc successfully patched, you can make the function immediately available with exec zsh

The br function has been successfully installed.
You may have to restart your shell or source your shell init files.
Afterwards, you should start broot with br in order to use its full power.
```
