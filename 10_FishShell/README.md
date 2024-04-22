# link

- [fishshell-tutorial튜토리얼](#fishshell-tutorial)
- [fishshell-hitory-폴더](#fishshell-hitory-폴더)
- [디폴트셸로 쓰기fishshell을-default-shell-세팅하기](#fishshell을-default-shell-세팅하기)
  - [기본세팅 예시fishshell-configfish기본-셋](#fishshell-configfish기본-셋) 

- [FishShell Plugins플러그인 설치](#fish에-plugin-설치-하기)
  - [starship이-가장-깔끔테마는-이게-낫다-그냥-이걸로-바로-세팅하자](#starship이-가장-깔끔테마는-이게-낫다-그냥-이걸로-바로-세팅하자)
  - [#oh-my-fish-쉘-꾸미기](#oh-my-fish-쉘-꾸미기)
  - [zsh-path-다수의-폴더를-설정해-주기](#zsh-path-다수의-폴더를-설정해-주기)
  - [`cd...`--zsh처럼-하게-기능-만들기](#cd--zsh처럼-하게-기능-만들기)

<hr>

# FishShell Install

1. Fishshell
2. oh-my https://github.com/oh-my-fish/oh-my-fish
3. [fisher install](#fish에-plugin-설치-하기)
4. 다 설정하고 마지막으로 디폴트셸(How do I set fish as the default shell)로 fishshell로 세팅하기
  - Then `chsh -s /usr/local/bin/fish`

# fishshell을 Default shell 세팅하기

- In `/etc/shells`, add `/usr/local/bin/fish`:

```
vi /etc/shells
```

# List of acceptable shells for chpass(1).
- Ftpd will not allow users to connect who are not using
- one of these shells.

```
/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/fish
```

- Then `chsh -s /usr/local/bin/fish`.
```bash
which fish
```
해서 fish경로(which로 경로 확인) 에 맞춰서 `chsh`해주면 된다.

```bash
chsh -s /usr/local/bin/fish
```

- https://askubuntu.com/questions/26439/how-do-i-set-fish-as-the-default-shell

# FishShell Tutorial[[🔝]](#link)
- https://github.com/jorgebucaran/cookbook.fish

# FishShell[[🔝]](#link)

- https://fishshell.com/

```bash
./config/fish
  
```

# fishshell default 세팅하기[[🔝]](#link)
- https://stackoverflow.com/questions/453236/how-can-i-set-my-default-shell-on-a-mac-e-g-to-fish

# Fish Shell 에 PATH추가 하기 [[🔝]](#link)

- `echo $PATH`로 잘 들어갔나 확인하기
```bash
echo $PATH
```

```
set -U fish_user_paths $HOME/utilities/nvim-macos/bin/ $fish_user_paths


set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
```
- https://velog.io/@agiletalk/Fish-Shell%EC%97%90-PATH-%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0
- 명령어 쓰고 뒤에 쓰면 끝 편하네 
  - https://fishshell.com/docs/current/cmds/fish_add_path.html

- 잘못 쓴 PATH 지우기
  - https://superuser.com/questions/776008/how-to-remove-a-path-from-path-variable-in-fish
  ```
  set --erase --universal fish_user_paths[5]
  ```

- function만들어 주기
```
function addpaths
    contains -- $argv $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end
```

- path remove지우는 function만들기
```
function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end
```

- 테스트
```
Example Usage:

$ addpaths /etc /usr/libexec
Modifying PATH: /usr/local/bin /usr/bin /bin /usr/sbin /sbin
Updated PATH: /etc /usr/libexec /usr/local/bin /usr/bin /bin /usr/sbin /sbin

$ removepath /usr/libexec
Modifying PATH: /etc /usr/libexec /usr/local/bin /usr/bin /bin /usr/sbin /sbin
Updated PATH: /etc /usr/local/bin /usr/bin /bin /usr/sbin /sbin

```

- https://superuser.com/questions/776008/how-to-remove-a-path-from-path-variable-in-fish



# Fish에 Plugin 설치 하기[[🔝]](#link)

- 플러그인 매니져
  - https://github.com/jorgebucaran/fisher

- https://github.com/jethrokuan/z

# starship이 가장 깔끔(테마는 이게 낫다. 그냥 이걸로 바로 세팅하자)[[🔝]](#link)

https://starship.rs/ko-kr/


# Plugin[[🔝]](#link)

- https://www.reddit.com/r/fishshell/comments/t9yinj/what_are_your_favorite_fish_plugins/

```
fisher install jethrokuan/z
fisher install oh-my-fish/plugin-ssh
fisher install patrickf3139/colored-man-pages
fisher install axkirillov/tokyonight-fish
```

# oh-my-fish (쉘 꾸미기)[[🔝]](#link)
- https://github.com/oh-my-fish/oh-my-fish
- ohmyfish
  - https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

# 한국사람이 정리해줌[[🔝]](#link)
https://blog.youngbin.xyz/2015-07-30-install-fish-then-customize-it-with-oh-my-fish/

# z 설치하기[[🔝]](#link)

- https://github.com/jorgebucaran/fisher
- https://github.com/jethrokuan/z

# FishShell Hitory 폴더 [[🔝]](#link)

- typically 
```
~/.local/share/fish/fish_history
```

- https://fishshell.com/docs/current/cmds/history.html

# FishShell (config.fish기본 셋)[[🔝]](#link)

- `echo $MOJO_PATH` 하면 PATH 잡힘(1회성 -gx 넣어서 안에 넣어주자)
```sh
set MOJO_PATH $(modular config mojo.path)
```

```fish
# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
# macOS PATH(homebrew)
fish_add_path "/opt/homebrew/bin/"

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/utilities/nvim-macos"
fish_add_path "$HOME/utilities/zig_0_12"
fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.wasmer/bin"


if status is-interactive
    # Commands to run in interactive sessions can go here

# add Path
function addpaths
    contains -- $argv $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end

# Remove path
function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end

end

## Mojo PATH
set -gx MOJO_PATH $(modular config mojo.path)
set -gx MODULAR_HOME $HOME/.modular
## Mojo MAX
set -gx MAX_PATH $(modular config max.path)
set -gx MAX_PATH $HOME/.modular/bin

## C++ PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/c++/11 /usr/include/x86_64-linux-gnu/c++/11 /usr/lib/gcc/x86_64-linux-gnu/11 /usr/lib/gcc/x86_64-linux-gnu/12 $CPLUS_INCLUDE_PATH


# WASM (wasmer run)
set -gx WASMER_DIR $HOME/.wasmer

end

# Enable Starship prompt
starship init fish | source

# Wasmer
export WASMER_DIR="/Users/g/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
```

# zsh PATH 다수의 폴더를 설정해 주기[[🔝]](#link)

- https://github.com/fish-shell/fish-shell/issues/527
  - 한칸 띄우고 연속으로 입력해 주면 된다. zsh는 세미콜론(:)으로 구분 하지만 FishShell은 띄어 쓰기로 구분한다.
    
```
set -gx PATH /opt/qt/Tools/QtCreator/bin /opt/qt/5.0.0/gcc_64/bin $PATH
```

# cd ... zsh처럼 하게 기능 만들기[[🔝]](#link)
https://github.com/fish-shell/fish-shell/issues/2671

- 쉬운거 그냥 플러그인 설치하자 ㅋㅋ

```
fisher install nickeb96/expanddots


fisher add nickeb96/expanddots
```

```bash
function cd --description "Change directory"

    # Skip history in subshells
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions
    set -l previous $PWD

    if test $argv[1] = - ^/dev/null
        if test "$__fish_cd_direction" = next ^/dev/null
            nextd
        else
            prevd
        end
        return $status
    end

    # Path replacement - in /home/alfa/Music, `cd alfa bravo` should go to /home/bravo/Music
    if set -q argv[2]
        set argv[1] (string replace -- $argv[1] $argv[2] $PWD)
    end

    # If argument consists solely of dots, go up number of dots - 1 directories - `cd ...` goes up to the grandparent
    if string match -qr '^\.{3,}$' -- $argv[1]
        # Only do this if there's no directory called "..." - which is theoretically allowed
        test -d $argv[1]; or set argv[1] (string replace "." "" -- $argv[1] | string replace -a "." "../")
    end

    builtin cd $argv[1]
    set -l cd_status $status

    if test $cd_status = 0 -a "$PWD" != "$previous"
        set -g dirprev $dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev
    end

    return $cd_status
end
```

# sdkman 설치(Java, Kotlin)

- https://github.com/reitzig/sdkman-for-fish

```
fisher install reitzig/sdkman-for-fish@v2.1.0
```
