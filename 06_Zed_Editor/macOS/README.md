# Release Note v1.3
- Terminal Threads have landed.
- Open a terminal right in the Threads Sidebar and run claude, codex, or any other CLI agent alongside your built-in agent threads.
  - Completion menu items can now show a single-letter kind badge next to each entry.
  - Enable it with `"completion_menu_item_kind": "symbol"`.
  - You can now configure a separate model for subagents with the new agent.subagent_model setting.

- Tip: Use a frontier model for the main agent, and something faster and cheaper for subagents.

```json
"agent": {
  "subagent_model": {
    "model": "gpt-5-mini",
    "provider": "zed.dev"
  }
}
```
