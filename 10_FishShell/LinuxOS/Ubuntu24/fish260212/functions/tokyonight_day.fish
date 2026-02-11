# TokyoNight Color Palette
set -l foreground 3760bf
set -l background e1e2e7
set -l selection 99a7df
set -l comment 848cb5
set -l red f52a65
set -l orange b15c00
set -l yellow 8c6c3e
set -l green 587539
set -l purple 7847bd
set -l cyan 007197
set -l pink 9854f1

# Syntax Highlighting Colors
set -U fish_color_normal $foreground
set -U fish_color_command $cyan
set -U fish_color_keyword $pink
set -U fish_color_quote $yellow
set -U fish_color_redirection $foreground
set -U fish_color_end $orange
set -U fish_color_error $red
set -U fish_color_param $purple
set -U fish_color_comment $comment
set -U fish_color_selection --background=$selection
set -U fish_color_search_match --background=$selection
set -U fish_color_operator $green
set -U fish_color_escape $pink
set -U fish_color_autosuggestion $comment

# Completion Pager Colors
set -U fish_pager_color_progress $comment
set -U fish_pager_color_prefix $cyan
set -U fish_pager_color_completion $foreground
set -U fish_pager_color_description $comment
set -U fish_pager_color_selected_background --background=$selection

# Background
_tokyonight_set_background $foreground $background

set -Ux TOKYONIGHT day
