# Ubuntu24.04(FishShell세팅)

- config.fish
```fish

fish_add_path "$HOME/utilities/nvim-linux64/bin"
fish_add_path "$HOME/utilities/zls/zig-out/bin/"
fish_add_path "$HOME/utilities/zig-linux"
fish_add_path "$HOME/Qt/6.7.2/gcc_64/bin"
fish_add_path "$HOME/Qt/6.7.2/gcc_64/include"
fish_add_path "$HOME/.config/Code/User/globalStorage/fwcd.kotlin/langServerInstall/server/bin/"
fish_add_path "$HOME/utilities/wasmtime-dev-x86_64-linux/"
fish_add_path "$HOME/.modular/bin"

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

set -gx EDITOR $HOME/utilities/nvim-linux64/bin/nvim
set -gx HELIX_RUNTIME $HOME/.config/helix/runtime

# C++ PATH
export CPLUS_INCLUDE_PATH=/usr/include/c++/13:/usr/include/x86_64-linux-gnu/c++/13:/usr/lib/gcc/x86_64-linux-gnu/11:/usr/lib/gcc/x86_64-linux-gnu/13

end

# ~/.config/fish/config.fish:

starship init fish | source
fish_add_path /home/g/.modular/bin
  
```
