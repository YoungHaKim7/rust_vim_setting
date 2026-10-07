# toml 실패한거 잘 살려보자

```toml
# ============================================================================
# Theme
# ============================================================================

# theme = "fleet_dark"
# theme = "fleet_dark_y"
# theme = "solarized_dark"
# theme = "nightfox"
# theme = "term16_dark_y"
theme = "kanagawa_y"


# ============================================================================
# Editor
# ============================================================================

[editor]
line-number = "relative"
mouse = false
color-modes = true
cursorline = true
auto-pairs = true
true-color = true
scroll-lines = 5
idle-timeout = 50
completion-trigger-len = 1

# Minimum severity to show a diagnostic after the end of a line.
end-of-line-diagnostics = "hint"


# ============================================================================
# Indent Guides
# ============================================================================

[editor.indent-guides]
render = true
character = "┊"


# ============================================================================
# LSP
# ============================================================================

[editor.lsp]
display-messages = true
display-inlay-hints = true

# Inlay hints:
# :set lsp.display-inlay-hints false


# ============================================================================
# Cursor Shape
# ============================================================================

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "underline"


# ============================================================================
# Statusline
# ============================================================================

[editor.statusline]
left = [
    "mode",
    "spinner",
    "file-name",
    "file-type",
    "total-line-numbers",
    "file-encoding",
]

center = []

right = [
    "selections",
    "primary-selection-length",
    "position",
    "position-percentage",
    "spacer",
    "diagnostics",
    "workspace-diagnostics",
    "version-control",
]


# ============================================================================
# File Picker
# ============================================================================

[editor.file-picker]
hidden = false


# ============================================================================
# Inline Diagnostics
# ============================================================================

[editor.inline-diagnostics]

# Minimum severity to show a diagnostic on the primary cursor's line.
# Note that `cursor-line` diagnostics are hidden in insert mode.
cursor-line = "error"

# Minimum severity to show a diagnostic on other lines.
# other-lines = "error"


# ============================================================================
# Key Settings
# ============================================================================

# At most one section each of:
#   keys.normal
#   keys.insert
#   keys.select


# ============================================================================
# Normal Mode
# ============================================================================

[keys.normal]

# --------------------------------------------------------------------------
# Basic movement / editing
# --------------------------------------------------------------------------

a = ["append_mode", "collapse_selection"]

# w = "move_line_up" # Maps the 'w' key to move_line_up

o = ["open_below", "insert_mode"]
O = ["open_above", "insert_mode"]

C-a = "increment"
C-x = "decrement"


# --------------------------------------------------------------------------
# LSP
# --------------------------------------------------------------------------

g = { a = "code_action" } # Maps `ga` to show possible code actions.


# --------------------------------------------------------------------------
# Command launcher
# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# Window navigation
# --------------------------------------------------------------------------

space.c = "toggle_comments"

space.w.h = "jump_view_left"
space.w.l = "jump_view_right"
space.w.j = "jump_view_down"
space.w.k = "jump_view_up"

space.w.o = "hsplit"
space.w.v = "vsplit"


# --------------------------------------------------------------------------
# Muscle memory
# --------------------------------------------------------------------------

"{" = ["goto_prev_paragraph", "collapse_selection"]
"}" = ["goto_next_paragraph", "collapse_selection"]

0 = "goto_line_start"
"$" = "goto_line_end"
"^" = "goto_first_nonwhitespace"
G = "goto_file_end"
"%" = "match_brackets"

V = ["select_mode", "extend_to_line_bounds"]

C = ["collapse_selection", "extend_to_line_end", "change_selection"]
# Requires:
# https://github.com/helix-editor/helix/issues/2051#issuecomment-1140358950

D = ["extend_to_line_end", "delete_selection"]

S = [
    "goto_first_nonwhitespace",
    "collapse_selection",
    "extend_to_line_end",
    "change_selection",
]
# Would be nice to be able to do something after this but it isn't chainable.

s = ["delete_selection", "insert_mode"]

X = ["move_char_left", "delete_selection"]


# --------------------------------------------------------------------------
# Extend and select commands
# --------------------------------------------------------------------------

# Extend and select commands that expect a manual input can't be chained.
#
# I've kept d[X] commands here because it's better to at least have the
# stuff you want to delete selected so that it's just a keystroke away
# to delete.


# --------------------------------------------------------------------------
# Clipboard
# --------------------------------------------------------------------------

# Clipboards over registers ye ye

x = [
    "yank_main_selection_to_clipboard",
    "normal_mode",
    "flip_selections",
    "collapse_selection",
    "delete_selection",
]

p = "paste_clipboard_after"
P = "paste_clipboard_before"

y = [
    "yank_main_selection_to_clipboard",
    "normal_mode",
    "flip_selections",
    "collapse_selection",
]

Y = [
    "extend_to_line_bounds",
    "yank_main_selection_to_clipboard",
    "goto_line_start",
    "collapse_selection",
]


# --------------------------------------------------------------------------
# Vim-style word movement
# --------------------------------------------------------------------------

# Uncanny valley stuff.
# This makes w and b behave as they do in Vim.

w = ["move_next_word_start", "move_char_right", "collapse_selection"]

e = ["move_next_word_end", "collapse_selection"]

b = ["move_prev_word_start", "collapse_selection"]

[keys.normal."backspace"]
c = ":sh cargo run"
t = ":sh cargo nextest run"
r = ":reload"
f = ":format"
s = ":w"
l = ":log-open"
g = ":sh gcc -pthread -lm -Wall -Wextra -ggdb -o main main.c"
d = ":sh rm -rf main main.dSYM"
n = ":sh touch .gitignore"
k = ":sh clang++ -Wall -Wetra -std=c++17 main.cpp -o main"
a = ":sh clang -pthread -lm -Wall -Wextra -ggdb -o main main.c"
x = ":sh chmod +x build.sh"

# ============================================================================
# Insert Mode
# ============================================================================

[keys.insert]

j = [{ k = "normal_mode" }, { space = "extend_line" }]


# Maps `jk` to exit insert mode.
# ============================================================================
# Select Mode
# ============================================================================

[keys.select]


# --------------------------------------------------------------------------
# Custom line operations
# --------------------------------------------------------------------------

C-k = [
    "goto_line_end",
    "extend_line_below",
    "delete_selection",
    "move_line_up",
    "paste_before",
    "select_mode",
]

C-j = [
    "goto_line_end",
    "extend_line_below",
    "delete_selection",
    "paste_after",
    "select_mode",
]


# --------------------------------------------------------------------------
# Muscle memory
# --------------------------------------------------------------------------

"{" = ["extend_to_line_bounds", "goto_prev_paragraph"]

"}" = ["extend_to_line_bounds", "goto_next_paragraph"]

0 = "goto_line_start"
"$" = "goto_line_end"
"^" = "goto_first_nonwhitespace"
G = "goto_file_end"

D = ["extend_to_line_bounds", "delete_selection", "normal_mode"]

C = ["goto_line_start", "extend_to_line_bounds", "change_selection"]

"%" = "match_brackets"

# S = "surround_add"
# Basically 99% of what I use vim-surround for.


# --------------------------------------------------------------------------
# Visual-mode specific muscle memory
# --------------------------------------------------------------------------

i = "select_textobject_inner"
a = "select_textobject_around"

# x = "delete_selection"


# --------------------------------------------------------------------------
# Multiple cursors
# --------------------------------------------------------------------------

# Some extra binds to allow us to insert/append in select mode
# because it's nice with multiple cursors.

tab = ["insert_mode", "collapse_selection"]

# C-a = ["append_mode", "collapse_selection"]


# --------------------------------------------------------------------------
# Line selection
# --------------------------------------------------------------------------

# Make selecting lines in visual mode behave sensibly.

k = ["extend_line_up", "extend_to_line_bounds"]

j = ["extend_line_down", "extend_to_line_bounds"]


# --------------------------------------------------------------------------
# Clipboard
# --------------------------------------------------------------------------

# Clipboards over registers ye ye

d = ["yank_main_selection_to_clipboard", "delete_selection"]

x = "delete_selection"

y = [
    "yank_main_selection_to_clipboard",
    "normal_mode",
    "flip_selections",
    "collapse_selection",
]

Y = [
    "extend_to_line_bounds",
    "yank_main_selection_to_clipboard",
    "goto_line_start",
    "collapse_selection",
    "normal_mode",
]

p = "replace_selections_with_clipboard"
# No life without this.

P = "paste_clipboard_before"


# --------------------------------------------------------------------------
# Escape the madness!
# --------------------------------------------------------------------------

# No more fighting with the cursor!
# Or with multiple cursors!

esc = ["collapse_selection", "keep_primary_selection", "normal_mode"]

```
