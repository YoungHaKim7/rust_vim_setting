function _puffer_fish_expand_buck
    if commandline --search-field >/dev/null 2>&1
        commandline --search-field --insert '$'
    else if string match --quiet '!' -- "$(commandline --current-token)"
        commandline --current-token ''
        commandline -f history-token-search-backward
    else
        commandline --insert '$'
    end
end
