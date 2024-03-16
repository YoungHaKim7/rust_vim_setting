# link

- [fishshell-hitory-폴더](#fishshell-hitory-폴더)

<hr>

# FishShell

- https://fishshell.com/

```bash
./config/fish
  
```

# fishshell default 세팅하기
- https://stackoverflow.com/questions/453236/how-can-i-set-my-default-shell-on-a-mac-e-g-to-fish

# Fish Shell 에 PATH추가 하기 

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


# Fish에 Plugin 설치 하기

- 플러그인 매니져
  - https://github.com/jorgebucaran/fisher

- https://github.com/jethrokuan/z

# starship이 가장 깔끔(테마는 이게 낫다. 그냥 이걸로 바로 세팅하자)

https://starship.rs/ko-kr/


# Plugin

- https://www.reddit.com/r/fishshell/comments/t9yinj/what_are_your_favorite_fish_plugins/

```
fisher install jethrokuan/z
fisher install oh-my-fish/plugin-ssh
fisher install patrickf3139/colored-man-pages
fisher install axkirillov/tokyonight-fish
```

# oh-my-fish (쉘 꾸미기)
- https://github.com/oh-my-fish/oh-my-fish
- ohmyfish
  - https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

# 한국사람이 정리해줌
https://blog.youngbin.xyz/2015-07-30-install-fish-then-customize-it-with-oh-my-fish/

# z 설치하기

- https://github.com/jorgebucaran/fisher
- https://github.com/jethrokuan/z

# FishShell Hitory 폴더 

- typically 
```
~/.local/share/fish/fish_history
```

- https://fishshell.com/docs/current/cmds/history.html
