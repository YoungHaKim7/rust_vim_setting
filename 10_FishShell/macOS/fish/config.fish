# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

# Enable Starship prompt
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
