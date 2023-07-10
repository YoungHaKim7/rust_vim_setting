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

