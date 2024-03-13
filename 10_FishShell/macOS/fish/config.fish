# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/utilities/nvim-macos"
fish_add_path "$HOME/utilities/zig_0_12"
fish_add_path "$HOME/utilities/zls/zig-out/bin"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Enable Starship prompt
starship init fish | source
