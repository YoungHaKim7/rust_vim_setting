# 간단 Setting


# macOS 폴더는 딥하게 세팅 이거 더 좋다. 

- macOS 폴더 참조

<br>

<hr>

# [Linux] tmux 사용법 

- tmux 세팅
  - https://github.com/YoungHaKim7/rust_vim_setting

- tmux 구성 요소

  - session: 여러 윈도우로 구성
  - window: 터미널 화면, 세션 내에서 탭처럼 사용 가능
  - pane: 하나의 윈도우 내에서의 화면 분할

- session 관련 명령어

```
# 새로운 세션 생성
tmux new -s (session_name)

# 세션 만들면서 윈도우랑 같이 생성
tmux new -s (session_name) -n (window_name)

# 세션 종료
exit

# 세션 목록
tmux ls

# 세션 다시 시작하기(다시 불러오기)
tmux attach -t session_number

# 세션 중단하기
(ctrl + b) d

# 스크롤하기
ctrl + b + [

# 특정 세션 강제 종료
tmux kill-session -t session_number

윈도우 관련 명령어

# 새 윈도우 생성
(ctrl + b) c

# 새 윈도우 이동
(ctrl + b) b (숫자)

틀 관련 명령어

# 틀 나누기
(ctrl + b) % #좌우로 나누기
(ctrl + b) " #위아래로 나누기

# 틀끼리 이동하기
(ctrl + b) 방향키
(ctrl + b) q
(ctrl + b) o #순서대로 이동

# 틀 삭제
(ctrl + d)

# 틀 사이즈 조정
(ctrl + b) : resize_pane -L 10 #L,R,U,D 입력하면 상하좌우로 조절됨
(ctrl + b) (alt) 방향키

# 단축키 목록
(ctrl + b) ?
```

https://velog.io/@ur-luella/tmux-%EC%82%AC%EC%9A%A9%EB%B2%95


<hr>

<hr>

<br>

# 내가 setting tmux 일반적인 키와 다를 수 있음 ~~~~~~

# session 열린거 list 보기

```
(ctrl + b) w
By pressing the default tmux Meta combination Ctrl+B and then w
```
https://www.baeldung.com/linux/tmux-kill-respawn-pane

# session 죽이기

```
(ctrl + b) :
vim처럼 명령어 먹일 수 있음 그럼
kill-session

 (e.g. Ctrl+A or B, which is the default) and then : and type kill-session

- 내 세팅은 (ctrl + b) w 세션 위에서 x 누르고 y 눌러서 창 죽이면 됨. 오래 살아있네 ㅋ
```

https://superuser.com/questions/777269/how-to-close-a-tmux-session

# 많이 쓰는 단축키 정리

```
Ctrl + b 하고 뒤에 Command 하면 됨.

# 새창 만들기
(ctrl + b) c

# 밑에 분할해서 새창
(ctrl + b) -

# 옆으로 분할해서 새창
(ctrl + b)_

# 분할한 창 이동
(ctrl + b) 창이동은 j , k 이거 창 진입은 (i) Insert i

# 크기 조절은 대문자
(ctrl + b)  J, K

# 창 죽이기
(ctrl + b) x 

# 버퍼에 입력된 창 이동
(ctrl + b) 창이동은 버퍼 넘버 입력

# 창 이름 변경하기
(ctrl + b) $

# 지금까지 열린 모든 session list 보기  tmux ls 도 동일함
(ctrl + b) w
```

