set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plug-in Management

Plugin 'nanotech/jellybeans.vim' " vim thema skin

Plugin 'scrooloose/nerdtree' "file system explorer

Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes' " airline_themes
Plugin 'blueyed/vim-diminactive' "to dim inactive windows
Plugin 'talek/obvious-resize' "Obvious Resize_Windows

Plugin 'junegunn/vim-easy-align' "Vim alignment plugin.
Plugin 'nathanaelkane/vim-indent-guides' "visually displaying indent levels in Vim
Plugin 'townk/vim-autoclose'  " automatic closing of parentheses
Plugin 'luochen1990/rainbow' "colorful brackets.

Plugin 'matchparenpp'         " check parentheses.
Plugin 'majutsushi/tagbar' "current file and get an overview of its structure.
Plugin 'ycm-core/YouCompleteMe' "automatic_completion

Plugin 'rust-lang/rust.vim' "rust

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

" ObviousResizei

noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>

let g:obvious_resize_default = 2

noremap <silent> <C-Up> :<C-U>ObviousResizeUp 5<CR>

let g:obvious_resize_run_tmux = 1


syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number

set encoding=utf-8
let $LANG = 'en'
