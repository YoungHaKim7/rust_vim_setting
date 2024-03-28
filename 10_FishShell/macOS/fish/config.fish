# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
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



set -gx WASMER_DIR $HOME/.wasmer

end

# Enable Starship prompt
starship init fish | source

# Wasmer
export WASMER_DIR="/Users/gy-gyoung/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
