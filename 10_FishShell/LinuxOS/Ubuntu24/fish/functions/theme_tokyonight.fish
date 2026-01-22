#!/usr/bin/fish
function theme_tokyonight --description 'Apply tokyonight theme'
  set -l mode 'night'
  if test  (count $argv) -gt 0
    set mode $argv[1]
  end

  switch $mode
    case 'night'
		source $fish_function_path/tokyonight_night.fish
    case 'storm'
		source $fish_function_path/tokyonight_storm.fish
    case 'moon'
		source $fish_function_path/tokyonight_moon.fish
    case 'day'
		source $fish_function_path/tokyonight_day.fish
    case '*'
		source $fish_function_path/tokyonight_night.fish
  end
  return 0
end

