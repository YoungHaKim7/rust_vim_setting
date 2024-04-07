# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "$HOME/utilities/nvim-linux64/bin"
fish_add_path "$HOME/utilities/zig0_12"
fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/utilities/llvm17/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.modular"
fish_add_path "$HOME/.modular/bin"
fish_add_path "$HOME/.modular/pkg/packages.modular.com_max/bin"
fish_add_path "$HOME/utilities/python3_12_2"
fish_add_path "$HOME/anaconda3/bin"


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

## C++ PATH
set -gx CPLUS_INCLUDE_PATH /usr/include/c++/11 /usr/include/x86_64-linux-gnu/c++/11 /usr/lib/gcc/x86_64-linux-gnu/11 /usr/lib/gcc/x86_64-linux-gnu/12 $CPLUS_INCLUDE_PATH

## Mojo PATH
set -gx MOJO_PATH $(modular config mojo.path)
set -gx MODULAR_HOME $HOME/.modular
## Mojo MAX
set -gx MAX_PATH $(modular config max.path)
set -gx MAX_PATH $HOME/.modular/bin



end

# ~/.config/fish/config.fish

starship init fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gy/anaconda3/bin/conda
    eval /home/gy/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/gy/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/gy/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/gy/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
