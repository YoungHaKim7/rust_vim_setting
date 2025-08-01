# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.

# fish_add_path "$HOME/.local/bin"
fish_add_path -U /home/g/.local/bin
fish_add_path "$HOME/utilities/nvim-linux64/bin"
# fish_add_path "$HOME/utilities/zig-linux-x86_64"
# fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/.cargo/bin"
# fish_add_path "$HOME/.wasmer/bin"
fish_add_path "$HOME/.emacs.d/bin"


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
    # set -gx MOJO_PATH $(modular config mojo.path)
    # set -gx MODULAR_HOME $HOME/.modular
    ## Mojo MAX
    # set -gx MAX_PATH $(modular config max.path)
    # set -gx MAX_PATH $HOME/.modular/bin

    # C++ PATH
    # set -gx CPLUS_INCLUDE_PATH /usr/include/c++/v1 /usr/include/c++/14 /usr/include/c++/13 /usr/include/x86_64-linux-gnu/c++/13 /usr/lib/gcc/x86_64-linux-gnu/11 /usr/lib/gcc/x86_64-linux-gnu/13 /usr/include/c++/14 /usr/include/x86_64-linux-gnu/c++/14 $CPLUS_INCLUDE_PATH
    set -gx CPLUS_INCLUDE_PATH /usr/include/c++/14 /usr/include/x86_64-linux-gnu/c++/13 /usr/lib/gcc/x86_64-linux-gnu/11 /usr/lib/gcc/x86_64-linux-gnu/13 /usr/include/c++/14 /usr/include/x86_64-linux-gnu/c++/14 $CPLUS_INCLUDE_PATH

    set -x CPLUS_INCLUDE_PATH "$PREFIX/$HOST/include/c++/$GCCVERSION:$PREFIX/lib/gcc/$HOST/$GCCVERSION/include"


    # python Tensflow CUDA PATH
    #export XLA_FLAGS=--xla_gpu_cuda_data_dir=/usr/lib/cuda/

    # SDL3 PATH
    set -gx LD_LIBRARY_PATH /usr/local/lib

    # WASM (wasmer run)
    # set -gx WASMER_DIR $HOME/.wasmer

end

# Enable Starship prompt
starship init fish | source

# Wasmer
# export WASMER_DIR="/Users/g/.wasmer"
# [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# alias
#alias clang++="clang++-19"
# alias clangd="clangd-19"
alias clangd=clangd-20
