Fixed. Here's a summary:

**Cause:** puffer-fish binds `$` to `_puffer_fish_expand_buck`, whose first check (`commandline --search-field`) uses an option that only exists in fish ≥ 4.1. On your fish 3.7.0 it errors, and the function only redirected stdout (`>/dev/null`), not stderr — so the "unknown option" message was printed on every `$` press. The `$` itself was still inserted correctly; it was purely cosmetic noise.

**Fix:** changed line 2 of `~/.config/fish/functions/_puffer_fish_expand_buck.fish` to redirect stderr too:

```fish
if commandline --search-field >/dev/null 2>&1
```

Verified: the guard now falls through silently, and `$`/`!` history-expansion and dot-expansion still work as before.

Two notes:
- Open a **new terminal** (or run `functions -e _puffer_fish_expand_buck`) so fish reloads the edited function — the current session has the old copy in memory.
- Your copy of puffer-fish isn't tracked in `fish_plugins`, so fisher won't overwrite this patch. Alternatively, upgrading to fish ≥ 4.1 would make the check actually functional (it exists to insert a literal `$` into the pager search field when searching).
