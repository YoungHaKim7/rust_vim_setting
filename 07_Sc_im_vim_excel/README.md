# Homebrew for OSX users

```bash
brew install sc-im
```

# SC-IM: Vim-based Terminal Spreadsheet Editor!

https://youtu.be/K_8_gazN7h0

# sc-im 

https://github.com/andmarti1424/sc-im

# sc-im Tutorial

https://github.com/jonnieey/Sc-im-Tutorial


# Quick start

- Key	Purpose

```
=   	    Insert a numeric value
\   	    Insert a text value
e        	Edit a numeric value
E        	Edit a string value
x        	Delete current cell content
:q      	Quit the app
:h      	See help
:w        filename.sc	Save current spreadsheet in sc format
j        	Move down
k        	Move up
h        	Move left
l        	Move right
goab12   	go to cell AB12
u        	undo last change
C-r      	redo last change undone
yy      	Copy current cell
v        	select a range using cursor/hjkl keys
p        	paste a previously yanked cell or range
ir      	insert row
ic      	insert column
dr      	delete row
dc      	delete column

>         text 입력하기( 숫자 위에 그냥 입력하는 number가 string로 변환됨
fl        창 옆으로 늘기기 좌우
fk        창

aa        창 뒤어 나간 string 자동 으로 셀 늘려줌
```

# Configuration

The ```scimrc``` file can be used to configure ```sc-im```. The file should be placed in the ```~/.config/sc-im``` directory.

Here is an example ```~/.config/sc-im/scimrc``` :

```
set autocalc
set numeric
set numeric_decimal=0
set overlap
set xlsx_readformulas
```
