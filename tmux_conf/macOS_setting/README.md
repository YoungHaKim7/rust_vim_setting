# Key

- Ctrl + C 하고  뒤에  Command 하면 됨.
  - c 새창 만들기
  - - 밑에 분할해서 새창
  - _ 옆으로 분할해서 새창
  - 창이동은 j , k 이거  창 진입은 (i) Insert i
  - 크기 조절은 대문자 J, K
  - x 창 죽이기
  - 창이동은 버퍼 넘버 입력

```

# create session
bind C-c new-session

# find session
bind C-f command-prompt -p find-session 'switch-client -t %%'

# session navigation
bind BTab switch-client -l  # move to last session

# split current window horizontally
bind - split-window -v
# split current window vertically
bind _ split-window -h

# pane navigation
bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right
bind > swap-pane -D       # swap current pane with the next one
bind < swap-pane -U       # swap current pane with the previous one

# maximize current pane
bind + run 'cut -c3- ~/.tmux.conf | sh -s _maximize_pane "#{session_name}" #D'

# pane resizing
bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

```