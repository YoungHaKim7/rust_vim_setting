# This code shamelessly copied from tomyun/base16_fish
# (And people say the command line is portable.)

if test -n "$TMUX"
    # Tell tmux to pass the escape sequences through
    # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
    function put_template_var; printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $argv; end;
    function put_template_custom; printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $argv; end;
else if string match 'screen*' $TERM # [ "${TERM%%[-.]*}" = "screen" ]
    # GNU screen (screen, screen-256color, screen-256color-bce)
    function put_template_var; printf '\033P\033]%d;rgb:%s\007\033\\' $argv; end;
    function put_template_custom; printf '\033P\033]%s%s\007\033\\' $argv; end;
else if string match 'linux*' $TERM # [ "${TERM%%-*}" = "linux" ]
    function put_template_var; true; end;
    function put_template_custom; true; end;
else
    function put_template_var; printf '\033]%d;rgb:%s\033\\' $argv; end;
    function put_template_custom; printf '\033]%s%s\033\\' $argv; end;
end

function _tokyonight_set_background
    put_template_var 10 $argv[1] # foreground

    put_template_var 11 $argv[2] # background
    if string match 'rxvt*' $TERM # [ "${TERM%%-*}" = "rxvt" ]
        put_template_var 708 $argv[2] # internal border (rxvt)
    end

    put_template_custom 12 ";7" # cursor (reverse video)
end
