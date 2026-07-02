# releases/stable

- https://zed.dev/releases/stable

# Release Note v1.9(260702)

- Zed's pickers are resizable, with a live preview option. | Very Telescope! 🔭

- A new (very Telescope) way to search has landed as well.
Open it with the `text finder: toggle` action in the command palette.
 
Thanks ozacod!

# Release Note v1.8
 
- The new `agent.terminal_init_command` setting runs a command automatically whenever you open a new terminal thread in the agent panel.
- Added `editor: select inside delimiters` and `editor: select around delimiters` actions for selecting content within the nearest enclosing brackets, braces, parentheses, or quotes. Repeating the action expands the selection to the next enclosing pair. (#53789; thanks subeax)


# Zed v1.5.4 (2026-06-06)
Fix crash that could occur when unsplitting a side by side diff view (#58695)
acp: Fix for certain ACP Registry agent downloads not starting (#58633)
Update both editor: go to diagnostic and editor: go to previous diagnostic to prefer activating the diagnostic under the cursor before jumping to the next or previous diagnostic, respectively (#58603)
Fixed high CPU usage when using Zeta in some cases (thanks @clupprich!) (#58591)
Fixed a crash that could occur while streaming agent edits containing multibyte characters. (#58452)
Fixed an issue where Zed would stop responding to file system changes in some cases (#58692

# Zed v1.5.3 (2026-06-03)
This week’s release includes a new Mermaid renderer with faster and more accurate diagrams, clickable document links provided by language servers, and the ability to rename threads directly in the sidebar.
Features
AI
Agent: Made the Skill Creator window resizable and its contents scrollable when the window is smaller than the form. (#57754)
Agent: Improved read_file tool output rendering with a line-number gutter. (#56779)
Agent: Improved scrolling smoothness when expanding read_file tool calls with large file outlines. (#57287)
Agent: Improved visibility of pending tool call confirmations when they are scrolled out of view in the Agent Panel. (#57632)
Agent: Added a notification indicator to collapsed project headers in the sidebar when a thread completes. (#57322)
Agent: Added Fast Mode (priority service tier) support to OpenAI models used through the ChatGPT subscription provider. (#57436)
Agent: Added Fast Mode (priority service tier) support to the OpenAI API provider. (#57412)
Agent: Made file paths in backticks clickable in the Agent Panel; clicking opens the referenced file at the given line when present. (#57303)
Agent: Added automatic refreshes for the list of Zed-hosted models, without requiring a restart. (#57528)
Agent: Added the ability to reorder projects by moving them up and down through the sidebar ellipsis menu. (#57448)
Agent: Added support for renaming agent threads directly from the sidebar. (#57656)
OpenCode: Updated the model list, adding Gemini 3.5 Flash and Grok Build 0.1 and removing MiniMax M2.5 Free. (#57556; thanks Vlaaaaaaad)
ACP: Added a logout flow for agents that support it. (#57492)
ACP: Allowed external agents that support it to access all working directories in a project. (#57497)
Git
Added a git_commit_buffer_font_size setting and made the in-panel and modal commit message editors zoomable. (#56077)
Added icons for Bitbucket, Codeberg, Forgejo, Gitea, and GitLab remote providers. (#57500; thanks albertbogusz)
Improved Git worktree creation by fetching the latest origin/main before creating a worktree. (#57704)
Improved Git Graph commit tooltips. (#57032; thanks aaronang)
Improved performance when opening the commit view for files with many diff hunks. (#57330)
Languages
Added support for clickable document links provided by language servers. This is enabled by default and can be disabled with "lsp_document_links": false. (#56011)
C++: Added recognition for HIP files. (#57333; thanks Young-TW)
Rust: Improved toolchain compatibility by using the rust-analyzer from a worktree’s Rust toolchain when specified. (#57696)
Vim / Helix
Swapped q and Q in Helix mode so they record and replay macros per Helix defaults instead of leaking Vim bindings. (#57622; thanks crazydude123)
Remote Development
Added support for local features in dev containers. (#55225; thanks KyleBarton)
Other
Improved Mermaid diagram rendering speed and accuracy. (#57644)
Added support for shift+click in Markdown preview to extend text selection. (#57586; thanks cppcoffee)
Added a UI control for wrapping and unwrapping Markdown code block contents. (#57312)
Made the Project Panel auto-reveal multi-buffer excerpts for the latest selection. (#57236)
Added the zed: open status page action for opening the Zed status page. (#57316)
Settings UI: Added the setting scope (user or project) to Settings Editor breadcrumbs. (#57437)
Bug Fixes
Agent: Fixed commit message generation not respecting instructions from global AGENTS.md. (#57827)
Agent: Fixed errors not appearing in the UI when an edit tool call failed. (#57722)
Agent: Fixed read_file tool output not re-rendering in restored threads. (#56779)
Agent: Fixed stutters that could occur when interacting with the agent. (#57712)
Agent: Fixed deprecated Rules being automatically included in new agent requests. (#57844)
Agent: Fixed extra link styling on file paths in tool call labels. (#57515)
Agent: Fixed global skill edits appearing without a file path in the changes summary. (#57767)
Agent: Fixed a crash that could occur when adding a crease to the Agent Panel. (#58375)
Agent: Fixed a crash that could occur when searching or configuring tools in agent profile settings. (#58299)
Helix: Fixed g i and g a invoking Vim-mode bindings instead of goto_implementation and goto_last_accessed_file. (#57621; thanks crazydude123)
Helix: Fixed g w not targeting words on lines selected with x. (#57565; thanks terror)
Helix: Fixed r not replacing multi-character selections in select mode. (#57553; thanks terror)
Helix: Fixed a crash that could occur when pasting at the end of a file. (#58373)
Fixed recent-project navigation always activating the main worktree instead of the last active worktree/workspace. (#57321)
Fixed edit prediction previews in the diff popover being occluded by open docks or the right sidebar. (#57519)
Fixed failed branch fetches preventing other Git state from updating. (#57292)
Fixed worktree creation being unavailable when resolving the default branch failed. (#57960)
Fixed branch enumeration when a broken Git ref prevents commit metadata from being read. (#57285; thanks GoldStrikeArch)
Fixed incorrect truncation of multi-line text in the UI. (#57450)
Fixed commit modal buttons being hidden for some ui_font_size values. (#56366)
Fixed dot (.) repeat not repeating the last change made by a macro (@register). (#57684; thanks Fanteria)
Fixed embedded terminal context menus showing agent actions that could target the wrong item. (#56256; thanks terror)
Fixed go to line going to arbitrary lines in multibuffers. (#57700)
Fixed jump-to-definition for file paths wrapped in punctuation, such as backticks, parentheses, or sentence-ending punctuation. (#45457; thanks subtleGradient)
Fixed language servers failing to install when the npm registry returns non-string values, such as "unpublished": null, in package time metadata. (#57765; thanks controversial)
Fixed a crash when rendering Mermaid diagram flowcharts with deeply nested subgraphs. (#58325)
Fixed a noisy not signed in error being logged on every keystroke when not signed in to Zed. (#57615; thanks seth-wood)
Fixed Markdown inline code highlighting in table cells. (#57506; thanks terror)
Fixed outline panel hangs during massive project searches. (#57814)
Fixed Project Panel git status indicators showing modified files with a warning color instead of the modified color. (#57716)
Fixed project-local skill creation for remote projects. (#57453)
Fixed rare panic in the open path dialog. (#57290)
Fixed file watcher log flooding and repeated watch attempts after hitting the OS file watch limit. (#57720)
Fixed remote server logs growing unbounded. (#57672)
Fixed the settings window not respecting the server-side window decorations setting. (#57371; thanks hollmmax)
Fixed the “About Zed” dialog being a full window instead of a floating window. (#57307; thanks cyyynthia)
Fixed the Git Panel branch name staying truncated even when the panel was wide enough to show the full name (#57238). (#57502; thanks mateioprea)
Fixed the project section header flickering in the agent threads sidebar when sending a message while the header was partially scrolled off screen. (#57529)
Fixed unnecessary Git state reloading that could occur when editing in linked worktrees. (#57763)
Fixed UTF-8 parsing issues when loading skill frontmatter with multi-codepoint graphemes, such as emoji, crossing file chunk boundaries. (#57466; thanks roboticsdude60)

# Breaking Changes and Notices
- Removed support for ACP extensions. Installed ACP extensions will be migrated to ACP servers provided by the ACP registry, and resources from deprecated extensions will be automatically removed. (#57133)
- Removed the retired GPT-5.2 and GPT-5.3 Codex models from the ChatGPT subscription provider. (#58340)
