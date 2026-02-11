function _puffer_fish_expand_dot
    if string match --quiet --regex -- '^(\.\./)*\.\.$' "$(commandline --current-token)"
        commandline --insert '/..'
    else
        commandline --insert '.'
    end
end
