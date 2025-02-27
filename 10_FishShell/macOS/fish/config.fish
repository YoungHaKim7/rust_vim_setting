# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
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
fish_add_path "$HOME/utilities/c3-lsp/server/bin/release"

fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path "$HOME/utilities/c3_compiler"
fish_add_path /opt/homebrew/opt/llvm@17/bin
fish_add_path /opt/homebrew/include/
fish_add_path /usr/local/include/opencv4
fish_add_path /opt/homebrew/opt/libpq/bin

fish_add_path /System/Volumes/Data/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/OpenGL.framework/Versions/A/Headers
fish_add_path -U /Users/gy-gyoung/utilities/glfw/include
fish_add_path /opt/homebrew/lib


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

    set -gx LIBRARY_PATH /opt/homebrew/lib /opt/homebrew/include

    # OpenCV
    set -gx PKG_CONFIG_PATH /opt/homebrew/bin

    # sdk man(java, kotlin)
    # set -gx

    # LLVM
    set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

    # LLVM 17(c3c)
    set -gx LDFLAGS "-L/opt/homebrew/opt/llvm@17/lib"
    set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm@17/include"

    # postgres PATH
    # For compilers to find libpq you may need to set:
    set -gx LDFLAGS -L/opt/homebrew/opt/libpq/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/libpq/include

    #For pkg-config to find libpq you may need to set:
    set -gx PKG_CONFIG_PATH /opt/homebrew/opt/libpq/lib/pkgconfig

end

# Enable Starship prompt
starship init fish | source

# Wasmer
export WASMER_DIR="/Users/gy-gyoung/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
