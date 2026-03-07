# higtlight 오류 해결

That panic is expected when running non-interactively. The important thing is that the highlighting is now working.

## Summary

**Problem:** You copied the entire `runtime/languages.toml` to `~/.config/helix/languages.toml`. When Helix tried to merge your config with the built-in one, it got a duplicate field error and fell back to defaults, breaking Rust syntax highlighting.

**Solution:** Removed the duplicate config file. Helix now uses its built-in language configuration with proper Rust syntax highlighting.

**To customize languages in the future**, create a minimal `~/.config/helix/languages.toml` with only your overrides:

```toml
# Example: Customize only Rust settings
[[language]]
name = "rust"
language-servers = ["rust-analyzer"]
auto-format = true
indent = { tab-width = 4, unit = "    " }
```

Your backup is saved at `/home/gy/.config/helix/languages.toml.backup` if you need to reference any customizations you had.
