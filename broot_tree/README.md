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


# ```broot``` or ```br``` 이렇게 누르면 실행된다.

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

# macOS 약간 버그 있어서 키 세팅 약간 다르게 해줘야함.
https://github.com/Canop/broot/issues/497

# Keymap

Notice the unlisted?

That's what makes it usable where the old tree command would produce pages of output.

.gitignore files are properly dealt with to put unwanted files out of your way.

As you sometimes want to see gitignored files, or hidden ones, you'll soon get used to the alti and alth shortcuts to toggle those visibilities.
```
alt + i 숨긴 폴더 보기 hedden off/on (to toggle showing hidden files)
```

```alt+ h``` to toggle showing hidden files (the ones whose name starts with a dot)

```
//  시간 순 정렬 sort
:sd
이거 한 후에
:sort_by_date

첨에 br실행 할때
br -w 하면 용량순으로 잘 나옴 .


// 파일명으로 찾기
e/

ex) e/temple


// 내가 원하는 문자열 찾기
c/

ex) c/main

// , you can check the usage of all filesystems, so that you focus on cleaning the full ones.
// 전체 용량 체크
:fs

```
