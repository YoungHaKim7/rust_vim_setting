"  """""""""""""""""""""""
" Generic Setting
"  """"""""""""""""""""""

" relativenumber No.
set number relativenumber

"esc setting
inoremap jk <esc>

syntax enable

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=5
filetype plugin indent on
filetype indent on
set showmatch
set autoindent

" font&size setting
set guifont=Hack\ Nerd\ Font:h20

" https://linuxhint.com/use-auto-indent-in-vim/
" :set filetype
" filetype=cpp
" filetype setting


set encoding=UTF-8
let $LANG = 'en'

"  """""""""""""""""""""""
" Key Setting
"  """"""""""""""""""""""

" windows size
noremap <silent> <C-L> :vertical resize +3<CR>
noremap <silent> <C-H> :vertical resize -3<CR>
noremap <silent> <C-J> :resize +3<CR>
noremap <silent> <C-K> :resize -3<CR>

let mapleader = " "

" ~~~~buffers  :bn next : bp  previous
nmap <silent> <Leader>b :buffers<CR>
nmap <silent> L <C-w>gt<CR>
nmap <silent> H <C-w>gT<CR>
nmap <silent> <Leader>j :tabfirst<CR>
nmap <silent> <Leader>k :tablast<CR>
nnoremap <silent><nowait> <space>t  :<C-u>tabe<CR>
nnoremap <silent><nowait> <space>n  :<C-u>:bn<CR>
nnoremap <silent><nowait> <space>p  :<C-u>:bp<CR>

" Move visually selected lines up or down in various modes.
" nnoremap K :m .-2<CR>==
" nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv==gv
vnoremap J :m '>+1<CR>gv==gv

" backup folder setting
set undodir=~/.vimdata/undo/
set backupdir=~/.vimdata/backup/
set directory=~/.vimdata/swap/

