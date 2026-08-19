# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.

fish_add_path "$HOME/.local/bin"
# fish_add_path -U /home/gy/.local/bin
# fish_add_path "$HOME/utilities/nvim-linux-x86_64/bin"
# fish_add_path "$HOME/utilities/zig-linux-x86_64"
# fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/.cargo/bin"
# fish_add_path "$HOME/.wasmer/bin"
#fish_add_path "$HOME/.emacs.d/bin"
fish_add_path -U ~/.config/emacs/bin
fish_add_path "$HOME/utilities/vulkansdk-linux-x86_64-1.4.357.1/1.4.357.1/x86_64/bin"

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

    # C++ (GCC 16 in /opt/gcc-16 finds its own headers/libs itself — do NOT set
    # CPLUS_INCLUDE_PATH/LIBRARY_PATH, that would mix GCC 13/14 headers into GCC 16 builds)
    set -gx LD_LIBRARY_PATH /opt/gcc-16/lib64 $LD_LIBRARY_PATH


    # python Tensflow CUDA PATH
    #export XLA_FLAGS=--xla_gpu_cuda_data_dir=/usr/lib/cuda/

    # SDL3 PATH
    set -gx LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH

    # WASM (wasmer run)
    # set -gx WASMER_DIR $HOME/.wasmer

    # Vulkan SDK PATH
    set -gx VULKAN_SDK $HOME/utilities/vulkansdk-linux-x86_64-1.4.357.1/1.4.357.1/x86_64
    # set -gx LD_LIBRARY_PATH "$VULKAN_SDK/lib:" $LD_LIBRARY_PATH
    set -gx LD_LIBRARY_PATH "$VULKAN_SDK/lib" $LD_LIBRARY_PATH
    set -gx VK_ADD_LAYER_PATH "$VULKAN_SDK/share/vulkan/explicit_layer.d" $VK_ADD_LAYER_PATH
    set -gx PKG_CONFIG_PATH "$VULKAN_SDK/lib/VulkanLoader/lib/pkgconfig" "$VULKAN_SDK/share/pkgconfig" "$VULKAN_SDK/lib/pkgconfig" $PKG_CONFIG_PATH
    set -gx CMAKE_PREFIX_PATH "$VULKAN_SDK" "$VULKAN_SDK/lib/VulkanLoader"

end

# Enable Starship prompt
starship init fish | source

# Wasmer
# export WASMER_DIR="/Users/g/.wasmer"
# [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# pnpm
set -gx PNPM_HOME "/home/gygy/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# alias
alias clang="clang-23"
alias clangd="clangd-23"
alias clang-format="clang-format-23"
alias gcc="/opt/gcc-16/bin/gcc"
