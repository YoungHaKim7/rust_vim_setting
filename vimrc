set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'blueyed/vim-diminactive'
Plugin 'junegunn/vim-easy-align'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'luochen1990/rainbow'
Plugin 'matchparenpp'         " check parentheses.
Plugin 'townk/vim-autoclose'  " automatic closing of parentheses

call vundle#end()

set t_Co=256

" for jellybeans
colorscheme jellybeans

" for taglist
nmap <F8> :Tagbar<CR>

" for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level= 2
let g:indent_guides_guide_size= 1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

" rust
let g:rustfmt_autosave = 1

" RainBow
let g:rainbow_active = 1 

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number

set encoding=utf-8
