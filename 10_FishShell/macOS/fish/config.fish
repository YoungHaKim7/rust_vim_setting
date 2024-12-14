# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/include/
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/utilities/nvim-macos"
fish_add_path "$HOME/utilities/zig"
fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.wasmer/bin"
fish_add_path "$HOME/.modular"
fish_add_path "$HOME/.modular/bin"
fish_add_path "$HOME/.modular/pkg/packages.modular.com_mojo/bin"
fish_add_path "$HOME/Library/Application Support/Code/User/globalStorage/fwcd.kotlin/langServerInstall/server/bin"
fish_add_path "$HOME/.surrealdb"

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

    set -gx MAX_PATH $HOME/.modular/bin
    set -gx MODULAR_HOME $HOME/.modular
    set -gx MOJO_PATH $(modular config mojo.path)

    set -gx WASMER_DIR $HOME/.wasmer

    # macOS SDL 2 , 3 Path
    set -gx DYLD_FRAMEWORK_PATH /Library/Frameworks
    set -gx LIBRARY_PATH /opt/homebrew/lib

    # sdk man(java, kotlin)
    # set -gx

end

# Enable Starship prompt
starship init fish | source

# Wasmer
export WASMER_DIR="/Users/gy-gyoung/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
