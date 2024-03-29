# 현재 폴더에서 alacritty 열기

```bash
alacritty --working-directory (pwd)
```
https://github.com/alacritty/alacritty/issues/808

<hr>

# alacritty 개인 세팅
- 이거 보고 대충 끼어 맞춰 보자
  - https://alacritty.org/config-alacritty.html
  - https://sunnnychan.github.io/cheatsheet/linux/config/alacritty.yml.html
- fish 셀 세팅바꿔주기
  - https://github.com/alacritty/alacritty/issues/6843

- mouse스크롤로 글씨 크기 조절
  - https://github.com/alacritty/alacritty/issues/7786
```toml
[mouse]
bindings = [
  { mouse = 275, action = "IncreaseFontSize"},
  { mouse = 276, action = "DecreaseFontSize"},
]
```

- mouse 관련

```toml
# 타이핑하면 마우스 커서 숨기기
[mouse]
hide_when_typing = true

# 마우스로 링크 클릭하면 브라우져 열리기 "unuesed 라고 경고 뜨는데 기능은 잘됨
[mouse.url.launcher]
program = []
```


<hr>

# macOS 주로 쓰는 단축키(alacritty)

```bash
# 새 창 열기 (탭으로 열림)
⌘ + t
command + T

# 창 1번 2번 이동
⌘ + 1 or 2
command + 1 or 2


# 1단어씩 지우기
⌥ + ⌫
option + backspace 



#  첫줄로 이동
^  + a
control + a


# 마지막 줄로 이동
^  + e
control + e 


# terminal 에서는 한 단어씩 이동 되는데 alacritty에서는 안된다. ㅠㅠ 
⌥ +  ← or →
option + arrow Right Left 

```

# LinuxOS 주로 쓰는 단축키(alacritty)

```
#  첫줄로 이동
Ctrl + a


# 마지막 줄로 이동
Ctrl + e

# 한줄 모두 삭제
Ctrl + u


```


<hr>

#  Ctrl+{arrow key} does not jump word #1408 

- https://github.com/alacritty/alacritty/issues/1408

- https://stackoverflow.com/questions/5029118/bash-ctrl-to-move-cursor-between-words-strings


# yml toml migrate

```
alacritty migrate
```

- LinuxOS (setting folder)

```
cd /etc/xdg/alacritty
```

# alacritty theme
- https://github.com/alacritty/alacritty-theme

- macOS 에서는 carbonfox 이 테마 쓰는중 ㅋ

```
─(gy)-[~/.config/alacritty/themes/themes]
$ ls

Cobalt2.toml               dracula.toml                        inferno.toml              papertheme.toml
Mariana.toml               everforest_dark.toml                iris.toml                 pencil_dark.toml
afterglow.toml             everforest_light.toml               iterm.toml                pencil_light.toml
alabaster.toml             falcon.toml                         kanagawa_dragon.toml      rainbow.toml
alabaster_dark.toml        flat_remix.toml                     kanagawa_wave.toml        remedy_dark.toml
argonaut.toml              flexoki.toml                        konsole_linux.toml        rose-pine-dawn.toml
atom_one_light.toml        github_dark.toml                    low_contrast.toml         rose-pine-moon.toml
ayu_dark.toml              github_dark_colorblind.toml         marine_dark.toml          rose-pine.toml
ayu_light.toml             github_dark_default.toml            material_theme.toml       seashells.toml
baitong.toml               github_dark_dimmed.toml             material_theme_mod.toml   smoooooth.toml
base16_default_dark.toml   github_dark_high_contrast.toml      meliora.toml              snazzy.toml
blood_moon.toml            github_dark_tritanopia.toml         midnight-haze.toml        solarized_dark.toml
bluish.toml                github_light.toml                   monokai_charcoal.toml     solarized_light.toml
breeze.toml                github_light_colorblind.toml        monokai_pro.toml          taerminal.toml
campbell.toml              github_light_default.toml           moonlight_ii_vscode.toml  tango_dark.toml
carbonfox.toml             github_light_high_contrast.toml     msx.toml                  tender.toml
catppuccin.toml            github_light_tritanopia.toml        night_owlish_light.toml   terminal_app.toml
catppuccin_frappe.toml     gnome_terminal.toml                 nightfox.toml             thelovelace.toml
catppuccin_latte.toml      gotham.toml                         noctis-lux.toml           tokyo-night-storm.toml
catppuccin_macchiato.toml  gruvbox_dark.toml                   nord.toml                 tokyo-night.toml
catppuccin_mocha.toml      gruvbox_light.toml                  nord_light.toml           tomorrow_night.toml
challenger_deep.toml       gruvbox_material.toml               nordic.toml               tomorrow_night_bright.toml
citylights.toml            gruvbox_material_medium_dark.toml   oceanic_next.toml         ubuntu.toml
cyber_punk_neon.toml       gruvbox_material_medium_light.toml  omni.toml                 wombat.toml
darcula.toml               hardhacker.toml                     one_dark.toml             xterm.toml
dark_pastels.toml          high_contrast.toml                  palenight.toml            zenburn.toml
deep_space.toml            horizon-dark.toml                   papercolor_dark.toml
doom_one.toml              hyper.toml                          papercolor_light.toml
```

<hr>

# ```alacritty -vv``` alacritty log를 볼 수 있다. 좋네 ㅎ

```bash
 alacritty -vv
PS D:\young_linux\rust_lang> Created log file at "C:\Users\user\AppData\Local\Temp\Alacritty-16376.log"
[0.000006400s] [INFO ] [alacritty] Welcome to Alacritty
[0.002761500s] [INFO ] [alacritty] Version 0.11.0 (d23330a)
[0.020445200s] [INFO ] [alacritty] Configuration files loaded from:
                                     "C:\\Users\\user\\AppData\\Roaming\\alacritty\\alacritty.yml"
[0.029258500s] [DEBUG] [alacritty] Loading "MesloLGS NF" font
[0.043650700s] [DEBUG] [alacritty] Estimated scaling factor: 1
[0.044871400s] [DEBUG] [alacritty] Estimated window size: Some(PhysicalSize { width: 1800, height: 884 })
[0.045444200s] [DEBUG] [alacritty] Estimated cell size: 12 x 26
[0.278023500s] [INFO ] [alacritty] Running on Intel(R) HD Graphics 530
[0.284605600s] [INFO ] [alacritty] Using OpenGL 3.3 renderer
[0.353297500s] [INFO ] [alacritty] Display scale factor: 1
[0.353932500s] [DEBUG] [alacritty] Filling glyph cache with common glyphs
[0.523957600s] [INFO ] [alacritty] Cell size: 12 x 26
[0.524623700s] [INFO ] [alacritty] Padding: 0 x 0
[0.524937400s] [INFO ] [alacritty] Width: 1800, Height: 884
[0.662310100s] [INFO ] [alacritty] PTY dimensions: 34 x 150
[0.752687000s] [INFO ] [alacritty] Initialisation complete
[0.790922900s] [DEBUG] [alacritty_terminal] Term::resize dimensions unchanged
[0.838170200s] [INFO ] [alacritty] Padding: 0 x 0
[0.878077300s] [INFO ] [alacritty] Width: 1800, Height: 884
```

https://github.com/alacritty/alacritty/issues/6931

# Alacritty - Terminal Emulator - Windows HowTo

https://youtu.be/1aw8IDH826Y

<br>

# WindowsOS_Rust개발자세팅Rust_054⭐️겁나게 빠른 터미널 소개해드립니다.Warp쓰고 싶은데 ...기다려야하니 일단 Alacritty쓰면서 기다리죠 #alacritty

https://youtu.be/h-Vm-17qJ88

<br>

## alacritty  Terminal Homepage

https://alacritty.org/

<br>

https://github.com/alacritty/alacritty

<br>

<hr>

# 내가 쓰고 싶은 Warp 지금은 (macOS만 가능ㅠㅠ230106기준) macOS_러스트로 만들어진 차세대 터미널warp데모영상

https://youtu.be/3MmhhixaqqA


<br>

##  Warp Terminal homepage

https://www.warp.dev/

<br>

# Windows OS Powershell 7.xx 버젼으로 세팅

https://github.com/alacritty/alacritty/issues/4817


# UTF-8 settings

https://unpkg.com/browse/alacritty-themes@4.1.1/alacritty.yml


# 외국인 alacritty 세팅


```
# Configuration for Alacritty, the GPU enhanced terminal emulator
#


# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty it self.
env:
  # TERM env customization.
  #
  # If this property is not set, alacritty will set it to xterm-256color.
  #
  # Note that some xterm terminfo databases don't declare support for italics.
  # You can verify this by checking for the presence of `smso` and `sitm` in
  # `infocmp xterm-256color`.
  TERM: xterm-256color

window:
  # Window dimensions in character columns and lines
  # Falls back to size specified by window manager if set to 0x0.
  # (changes require restart)
  dimensions:
    columns: 80
    lines: 24

  # Adds this many blank pixels of padding around the window
  # Units are physical pixels; this is not DPI aware.
  # (change requires restart)
  padding:
    x: 2
    y: 2

  # Window decorations
  # Setting this to false will result in window without borders and title bar.
  decorations: true

# Display tabs using this many cells (changes require restart)
tabspaces: 8

# When true, bold text is drawn using the bright variant of colors.
draw_bold_text_with_bright_colors: true

# Font configuration (changes require restart)
#
# Important font attributes like antialiasing, subpixel aa, and hinting can be
# controlled through fontconfig. Specifically, the following attributes should
# have an effect:
#
# * hintstyle
# * antialias
# * lcdfilter
# * rgba
#
# For instance, if you wish to disable subpixel antialiasing, you might set the
# rgba property to "none". If you wish to completely disable antialiasing, you
# can set antialias to false.
#
# Please see these resources for more information on how to use fontconfig
#
# * https://wiki.archlinux.org/index.php/font_configuration#Fontconfig_configuration
# * file:///usr/share/doc/fontconfig/fontconfig-user.html
font:
  # The normal (roman) font face to use.
  normal:
    family: monospace # should be "Menlo" or something on macOS.
    # Style can be specified to pick a specific face.
    # style: Regular

  # The bold font face
  bold:
    family: monospace # should be "Menlo" or something on macOS.
    # Style can be specified to pick a specific face.
    # style: Bold

  # The italic font face
  italic:
    family: monospace # should be "Menlo" or something on macOS.
    # Style can be specified to pick a specific face.
    # style: Italic

  # Point size of the font
  size: 11.0

  # Offset is the extra space around each character. offset.y can be thought of
  # as modifying the linespacing, and offset.x as modifying the letter spacing.
  offset:
    x: 0
    y: 0

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increase the x offset to move the glyph to
  # the right, increase the y offset to move the glyph upward.
  glyph_offset:
    x: 0
    y: 0

  # Scale the font size based on the monitor's DPI. This will lead to bigger text on HiDPI
  # screens and make reading text a little easier.
  # On X11 it is possible to change the DPI for each instance of alacritty by using
  # `WINIT_HIDPI_FACTOR=1.0 alacritty` to scale the font.
  scale_with_dpi: true

  # OS X only: use thin stroke font rendering. Thin strokes are suitable
  # for retina displays, but for non-retina you probably want this set to
  # false.
  use_thin_strokes: true

# Should display the render timer
render_timer: false

# Use custom cursor colors. If true, display the cursor in the cursor.foreground
# and cursor.background colors, otherwise invert the colors of the cursor.
custom_cursor_colors: false

# Colors (Tomorrow Night Bright)
colors:
  # Default colors
  primary:
    background: '0x000000'
    foreground: '0xeaeaea'

  # Colors the cursor will use if `custom_cursor_colors` is true
  cursor:
    text: '0x000000'
    cursor: '0xffffff'

  # Normal colors
  normal:
    black:   '0x000000'
    red:     '0xd54e53'
    green:   '0xb9ca4a'
    yellow:  '0xe6c547'
    blue:    '0x7aa6da'
    magenta: '0xc397d8'
    cyan:    '0x70c0ba'
    white:   '0xffffff'

  # Bright colors
  bright:
    black:   '0x666666'
    red:     '0xff3334'
    green:   '0x9ec400'
    yellow:  '0xe7c547'
    blue:    '0x7aa6da'
    magenta: '0xb77ee0'
    cyan:    '0x54ced6'
    white:   '0xffffff'

  # Dim colors (Optional)
  dim:
    black:   '0x333333'
    red:     '0xf2777a'
    green:   '0x99cc99'
    yellow:  '0xffcc66'
    blue:    '0x6699cc'
    magenta: '0xcc99cc'
    cyan:    '0x66cccc'
    white:   '0xdddddd'

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Possible values for `animation`
# `Ease`
# `EaseOut`
# `EaseOutSine`
# `EaseOutQuad`
# `EaseOutCubic`
# `EaseOutQuart`
# `EaseOutQuint`
# `EaseOutExpo`
# `EaseOutCirc`
# `Linear`
#
# To completely disable the visual bell, set its duration to 0.
#
visual_bell:
  animation: EaseOutExpo
  duration: 0

# Background opacity
background_opacity: 1.0

# Mouse bindings
#
# Currently doesn't support modifiers. Both the `mouse` and `action` fields must
# be specified.
#
# Values for `mouse`:
# - Middle
# - Left
# - Right
# - Numeric identifier such as `5`
#
# Values for `action`:
# - Paste
# - PasteSelection
# - Copy (TODO)
mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  # Faux Scrollback
  #
  # The `faux_scrollback_lines` setting controls the number
  # of lines the terminal should scroll when the alternate
  # screen buffer is active. This is used to allow mouse
  # scrolling for applications like `man`.
  #
  # To disable this completely, set `faux_scrollback_lines` to 0.
  faux_scrollback_lines: 1

selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>"

dynamic_title: true

hide_cursor_when_typing: false

# Style of the cursor
#
# Values for 'cursor_style':
# - Block
# - Underline
# - Beam
cursor_style: Block

# Live config reload (changes require restart)
live_config_reload: true

# Shell
#
# You can set shell.program to the path of your favorite shell, e.g. /bin/fish.
# Entries in shell.args are passed unmodified as arguments to the shell.
#
\n\nshell:\n program: /bin/bash\n args:\n - --login\n
# shell:
#   program: /bin/bash
#   args:
#     - --login

# Key bindings
#
# Each binding is defined as an object with some properties. Most of the
# properties are optional. All of the alphabetical keys should have a letter for
# the `key` value such as `V`. Function keys are probably what you would expect
# as well (F1, F2, ..). The number keys above the main keyboard are encoded as
# `Key1`, `Key2`, etc. Keys on the number pad are encoded `Number1`, `Number2`,
# etc.  These all match the glutin::VirtualKeyCode variants.
#
# A list with all available `key` names can be found here:
# https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
#
# Possible values for `mods`
# `Command`, `Super` refer to the super/command/windows key
# `Control` for the control key
# `Shift` for the Shift key
# `Alt` and `Option` refer to alt/option
#
# mods may be combined with a `|`. For example, requiring control and shift
# looks like:
#
# mods: Control|Shift
#
# The parser is currently quite sensitive to whitespace and capitalization -
# capitalization must match exactly, and piped items must not have whitespace
# around them.
#
# Either an `action`, `chars`, or `command` field must be present.
#   `action` must be one of `Paste`, `PasteSelection`, `Copy`, or `Quit`.
#   `chars` writes the specified string every time that binding is activated.
#     These should generally be escape sequences, but they can be configured to
#     send arbitrary strings of bytes.
#   `command` must be a map containing a `program` string, and `args` array of
#     strings. For example:
#     - { ... , command: { program: "alacritty", args: ["-e", "vttest"] } }
#
# Want to add a binding (e.g. "PageUp") but are unsure what the X sequence
# (e.g. "\x1b[5~") is? Open another terminal (like xterm) without tmux,
# then run `showkey -a` to get the sequence associated to a key combination.
key_bindings:
  - { key: V,        mods: Control|Shift,    action: Paste               }
  - { key: C,        mods: Control|Shift,    action: Copy                }
  - { key: Paste,                   action: Paste                        }
  - { key: Copy,                    action: Copy                         }
  - { key: Q,        mods: Command, action: Quit                         }
  - { key: W,        mods: Command, action: Quit                         }
  - { key: Insert,   mods: Shift,   action: PasteSelection               }
  - { key: Key0,     mods: Control, action: ResetFontSize                }
  - { key: Equals,   mods: Control, action: IncreaseFontSize             }
  - { key: Subtract, mods: Control, action: DecreaseFontSize             }
  - { key: Home,                    chars: "\x1bOH",   mode: AppCursor   }
  - { key: Home,                    chars: "\x1b[H",   mode: ~AppCursor  }
  - { key: End,                     chars: "\x1bOF",   mode: AppCursor   }
  - { key: End,                     chars: "\x1b[F",   mode: ~AppCursor  }
  - { key: PageUp,   mods: Shift,   chars: "\x1b[5;2~"                   }
  - { key: PageUp,   mods: Control, chars: "\x1b[5;5~"                   }
  - { key: PageUp,                  chars: "\x1b[5~"                     }
  - { key: PageDown, mods: Shift,   chars: "\x1b[6;2~"                   }
  - { key: PageDown, mods: Control, chars: "\x1b[6;5~"                   }
  - { key: PageDown,                chars: "\x1b[6~"                     }
  - { key: Tab,      mods: Shift,   chars: "\x1b[Z"                      }
  - { key: Back,                    chars: "\x7f"                        }
  - { key: Back,     mods: Alt,     chars: "\x1b\x7f"                    }
  - { key: Insert,                  chars: "\x1b[2~"                     }
  - { key: Delete,                  chars: "\x1b[3~"                     }
  - { key: Left,     mods: Shift,   chars: "\x1b[1;2D"                   }
  - { key: Left,     mods: Control, chars: "\x1b[1;5D"                   }
  - { key: Left,     mods: Alt,     chars: "\x1b[1;3D"                   }
  - { key: Left,                    chars: "\x1b[D",   mode: ~AppCursor  }
  - { key: Left,                    chars: "\x1bOD",   mode: AppCursor   }
  - { key: Right,    mods: Shift,   chars: "\x1b[1;2C"                   }
  - { key: Right,    mods: Control, chars: "\x1b[1;5C"                   }
  - { key: Right,    mods: Alt,     chars: "\x1b[1;3C"                   }
  - { key: Right,                   chars: "\x1b[C",   mode: ~AppCursor  }
  - { key: Right,                   chars: "\x1bOC",   mode: AppCursor   }
  - { key: Up,       mods: Shift,   chars: "\x1b[1;2A"                   }
  - { key: Up,       mods: Control, chars: "\x1b[1;5A"                   }
  - { key: Up,       mods: Alt,     chars: "\x1b[1;3A"                   }
  - { key: Up,                      chars: "\x1b[A",   mode: ~AppCursor  }
  - { key: Up,                      chars: "\x1bOA",   mode: AppCursor   }
  - { key: Down,     mods: Shift,   chars: "\x1b[1;2B"                   }
  - { key: Down,     mods: Control, chars: "\x1b[1;5B"                   }
  - { key: Down,     mods: Alt,     chars: "\x1b[1;3B"                   }
  - { key: Down,                    chars: "\x1b[B",   mode: ~AppCursor  }
  - { key: Down,                    chars: "\x1bOB",   mode: AppCursor   }
  - { key: F1,                      chars: "\x1bOP"                      }
  - { key: F2,                      chars: "\x1bOQ"                      }
  - { key: F3,                      chars: "\x1bOR"                      }
  - { key: F4,                      chars: "\x1bOS"                      }
  - { key: F5,                      chars: "\x1b[15~"                    }
  - { key: F6,                      chars: "\x1b[17~"                    }
  - { key: F7,                      chars: "\x1b[18~"                    }
  - { key: F8,                      chars: "\x1b[19~"                    }
  - { key: F9,                      chars: "\x1b[20~"                    }
  - { key: F10,                     chars: "\x1b[21~"                    }
  - { key: F11,                     chars: "\x1b[23~"                    }
  - { key: F12,                     chars: "\x1b[24~"                    }
  - { key: F1,       mods: Shift,   chars: "\x1b[1;2P"                   }
  - { key: F2,       mods: Shift,   chars: "\x1b[1;2Q"                   }
  - { key: F3,       mods: Shift,   chars: "\x1b[1;2R"                   }
  - { key: F4,       mods: Shift,   chars: "\x1b[1;2S"                   }
  - { key: F5,       mods: Shift,   chars: "\x1b[15;2~"                  }
  - { key: F6,       mods: Shift,   chars: "\x1b[17;2~"                  }
  - { key: F7,       mods: Shift,   chars: "\x1b[18;2~"                  }
  - { key: F8,       mods: Shift,   chars: "\x1b[19;2~"                  }
  - { key: F9,       mods: Shift,   chars: "\x1b[20;2~"                  }
  - { key: F10,      mods: Shift,   chars: "\x1b[21;2~"                  }
  - { key: F11,      mods: Shift,   chars: "\x1b[23;2~"                  }
  - { key: F12,      mods: Shift,   chars: "\x1b[24;2~"                  }
  - { key: F1,       mods: Control, chars: "\x1b[1;5P"                   }
  - { key: F2,       mods: Control, chars: "\x1b[1;5Q"                   }
  - { key: F3,       mods: Control, chars: "\x1b[1;5R"                   }
  - { key: F4,       mods: Control, chars: "\x1b[1;5S"                   }
  - { key: F5,       mods: Control, chars: "\x1b[15;5~"                  }
  - { key: F6,       mods: Control, chars: "\x1b[17;5~"                  }
  - { key: F7,       mods: Control, chars: "\x1b[18;5~"                  }
  - { key: F8,       mods: Control, chars: "\x1b[19;5~"                  }
  - { key: F9,       mods: Control, chars: "\x1b[20;5~"                  }
  - { key: F10,      mods: Control, chars: "\x1b[21;5~"                  }
  - { key: F11,      mods: Control, chars: "\x1b[23;5~"                  }
  - { key: F12,      mods: Control, chars: "\x1b[24;5~"                  }
  - { key: F1,       mods: Alt,     chars: "\x1b[1;6P"                   }
  - { key: F2,       mods: Alt,     chars: "\x1b[1;6Q"                   }
  - { key: F3,       mods: Alt,     chars: "\x1b[1;6R"                   }
  - { key: F4,       mods: Alt,     chars: "\x1b[1;6S"                   }
  - { key: F5,       mods: Alt,     chars: "\x1b[15;6~"                  }
  - { key: F6,       mods: Alt,     chars: "\x1b[17;6~"                  }
  - { key: F7,       mods: Alt,     chars: "\x1b[18;6~"                  }
  - { key: F8,       mods: Alt,     chars: "\x1b[19;6~"                  }
  - { key: F9,       mods: Alt,     chars: "\x1b[20;6~"                  }
  - { key: F10,      mods: Alt,     chars: "\x1b[21;6~"                  }
  - { key: F11,      mods: Alt,     chars: "\x1b[23;6~"                  }
  - { key: F12,      mods: Alt,     chars: "\x1b[24;6~"                  }
  - { key: F1,       mods: Super,   chars: "\x1b[1;3P"                   }
  - { key: F2,       mods: Super,   chars: "\x1b[1;3Q"                   }
  - { key: F3,       mods: Super,   chars: "\x1b[1;3R"                   }
  - { key: F4,       mods: Super,   chars: "\x1b[1;3S"                   }
  - { key: F5,       mods: Super,   chars: "\x1b[15;3~"                  }
  - { key: F6,       mods: Super,   chars: "\x1b[17;3~"                  }
  - { key: F7,       mods: Super,   chars: "\x1b[18;3~"                  }
  - { key: F8,       mods: Super,   chars: "\x1b[19;3~"                  }
  - { key: F9,       mods: Super,   chars: "\x1b[20;3~"                  }
  - { key: F10,      mods: Super,   chars: "\x1b[21;3~"                  }
  - { key: F11,      mods: Super,   chars: "\x1b[23;3~"                  }
  - { key: F12,      mods: Super,   chars: "\x1b[24;3~"                  }
```

