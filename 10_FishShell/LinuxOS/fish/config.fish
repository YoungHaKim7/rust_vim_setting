# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "$HOME/utilities/nvim-linux64/bin"
fish_add_path "$HOME/utilities/zig0_12"
fish_add_path "$HOME/utilities/zls/zig-out/bin"
fish_add_path "$HOME/utilities/llvm17/bin"
fish_add_path "$HOME/utilities/alacritty/target/release"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ~/.config/fish/config.fish

starship init fish | source
