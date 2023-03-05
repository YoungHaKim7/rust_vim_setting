set shell=/bin/bash

set rtp+=/opt/homebrew/opt/fzf

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plug-in Management

Plugin 'nanotech/jellybeans.vim' " vim thema skin
Plugin 'morhetz/gruvbox' " vim thema skin2

Plugin 'neoclide/coc.nvim', {'branch': 'release'} "CocInstall

Plugin 'ryanoasis/vim-devicons' "Pretty Icons
Plugin 'scrooloose/nerdtree' "file system explorer

Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes' " airline_themes
Plugin 'blueyed/vim-diminactive' "to dim inactive windows

Plugin 'junegunn/vim-easy-align' "Vim alignment plugin.
" Plugin 'nathanaelkane/vim-indent-guides' "visually displaying indent levels in Vim
Plugin 'Yggdroot/indentLine'
Plugin 'townk/vim-autoclose'  " automatic closing of parentheses
Plugin 'luochen1990/rainbow' "colorful brackets.

Plugin 'tpope/vim-surround' "support parentheses, brackets

Plugin 'matchparenpp'         " check parentheses.
Plugin 'ycm-core/YouCompleteMe' "automatic_completion

Plugin 'rust-lang/rust.vim' "rust
Plugin 'fannheyward/coc-rust-analyzer' "rust_analyzer
Plugin 'mattn/vim-lsp-settings' "rust_analyzer__lsp
Plugin 'liuchengxu/vista.vim' "Vista rust ctag
Plugin 'prabirshrestha/vim-lsp' 
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" haskell
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

" C # setting
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'dense-analysis/ale'


"{{ Syntax Highlighting and Colors }}
Plugin 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
Plugin 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
Plugin 'vim-python/python-syntax'                    " Python highlighting
Plugin 'ap/vim-css-color'                            " Color previews for CSS
"{{ Junegunn Choi Plugins }}
Plugin 'junegunn/goyo.vim'                           " Distraction-free viewing
Plugin 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plugin 'junegunn/vim-emoji'                          " Vim needs emojis!

" Unicode Vim :UnicodeTable
Plugin 'chrisbra/unicode.vim'

call vundle#end()

" basic settings~
set t_Co=256

" for jellybeans
colorscheme jellybeans

" for Vista-taglist
nmap <F8> :Vista<CR>

" 숨김 파일 표시 I - 숨긴 파일 보기 / R - Reflash / m - 파일 지울지 추가할지 메뉴 보기
let NERDTreeShowHidden=1

"  "  " for indent guide
" let g:indentguides_spacechar = '|'
" let g:indentguides_tabchar = '┆'
" let g:indentguides_tabchar = '¦'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level= 1
" let g:indent_guides_guide_size= 1

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar

" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 1

" RainBow
let g:rainbow_active = 1 


" rust
let g:rustfmt_autosave = 1

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" rust analyzer start~~~~~~:w
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
let g:ale_linters = {'rust': ['analyzer']}

"vim-lsp
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
let g:lsp_document_highlight_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"vim-lsp_Debugging
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

"asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" rust analyzer end~~~~~~

" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
let g:ycm_clangd_uses_ycmd_caching=0
" let g:ycm_clangd_binary_path='usr/bin/clangd'

" lines to save text folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set foldmethod=manual

" clojure
nmap cqp :call VSCodeNotify('calva.jackIn')<CR>
nmap cqq :call VSCodeNotify('calva.disconnect')<CR>
nmap cpr :call VSCodeNotify('calva.loadFile')<CR>
nmap cpR :call VSCodeNotify('calva.loadNamespace')<CR>
nmap cpp :call VSCodeNotify('calva.evaluateSelection')<CR>
nmap cqc :call VSCodeNotify('calva.evalCurrentFormInREPLWindow')<CR>


" ~~~~~ OmniSharp C# Setting~~~~~

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Enable snippet completion, using the ultisnips plugin
let g:OmniSharp_want_snippet=1
" ~~~~ end c# _imnisharp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rust InlayHint color setting
" highlight CocInlayHint     ctermbg=5
" hi CocInlayHint ctermbg=125

highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-L> :vertical resize +3<CR>
noremap <silent> <C-H> :vertical resize -3<CR>
noremap <silent> <C-J> :resize +3<CR>
noremap <silent> <C-K> :resize -3<CR>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Leader Key Setting & coc-actions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = "," 
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" ~~~~~~~~~~~~~~~~~~~~~~~~~~
" """""""""""""""""""""""""

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocDiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" nmap <silent> gs :sp<CR><Plug>(coc-definition)
" nmap <silent> gS :vsp<CR><Plug>(coc-definition)

" ~~~~buffers  :bn next : bp  previous
nmap <silent> <Leader>b :buffers<CR>
nmap <silent> <Leader>l <C-w>gt<CR>
nmap <silent> <Leader>h <C-w>gT<CR>
nmap <silent> <Leader>j :tabfirst<CR>
nmap <silent> <Leader>k :tablast<CR>
nnoremap <silent><nowait> <space>t  :<C-u>tabe<CR>
nnoremap <silent><nowait> <space>n  :<C-u>:bn<CR>
nnoremap <silent><nowait> <space>p  :<C-u>:bp<CR>
"~~~~~~~~~
" ~~~highlight Rust-analyzer
nnoremap <silent><nowait> <space>h  :<C-u>:hi CocInlayHint ctermbg=5 <CR>

" Move visually selected lines up or down in various modes.
" nnoremap K :m .-2<CR>==
" nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv==gv
vnoremap J :m '>+1<CR>gv==gv


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

" https://linuxhint.com/use-auto-indent-in-vim/
" :set filetype
" filetype=cpp
" filetype setting


set encoding=UTF-8
let $LANG = 'en'

" """""""""""""""""""""""""

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

"Clear all registers!
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor


