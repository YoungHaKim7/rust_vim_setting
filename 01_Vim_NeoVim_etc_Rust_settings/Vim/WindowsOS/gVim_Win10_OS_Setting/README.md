# vimrc

```

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" set the runtime path to include PlugIn and initialize
set rtp+=~/vimfiles/autoload/plug.vim

if has('python3')
endif

call plug#begin('~/vimfiles/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nanotech/jellybeans.vim' " vim thema skin

Plug 'ryanoasis/vim-devicons' "Pretty Icons
Plug 'scrooloose/nerdtree' "file system explorer

Plug 'vim-airline/vim-airline' " vim status bar
Plug 'vim-airline/vim-airline-themes' " airline_themes
Plug 'blueyed/vim-diminactive' "to dim inactive windows
Plug 'talek/obvious-resize' "Obvious Resize_Windows

Plug 'junegunn/vim-easy-align' "Vim alignment plugin.
Plug 'nathanaelkane/vim-indent-guides' "visually displaying indent levels in Vim
Plug 'Yggdroot/indentLine' " Visually displaying indent
Plug 'townk/vim-autoclose'  " automatic closing of parentheses
Plug 'luochen1990/rainbow' "colorful brackets.

" Plug 'matchparenpp'         " check parentheses.
Plug 'ycm-core/YouCompleteMe' "automatic_completion

Plug 'rust-lang/rust.vim' "rust
Plug 'fannheyward/coc-rust-analyzer' "rust_analyzer
Plug 'mattn/vim-lsp-settings' "rust_analyzer__lsp
Plug 'liuchengxu/vista.vim' " rust vista
Plug 'prabirshrestha/vim-lsp' 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'} "debug
Plug 'idanarye/vim-vebugger' "debug_

" C# Setting~
Plug 'OmniSharp/omnisharp-vim' "C#
Plug 'dense-analysis/ale' "C#

call plug#end()

"  Command	Description
"  :PlugInstall [name ...] [#threads]	Install plugins
"  :PlugUpdate [name ...] [#threads]	Install or update plugins
"  :PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
"  :PlugUpgrade	Upgrade vim-plug itself
"  :PlugStatus	Check the status of plugins
"  :PlugDiff	Examine changes from the previous update and the pending changes
"  :PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins


"  YouCompleteMe Setting
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
let g:ycm_server_python_interpreter = '~/AppData/Local/Microsoft/WindowsApps/python3.exe'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = {}


" Vista Setting~~
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" Vista setting end~

""  Rust analyzer inlayhint 
"let g:lsp_inlay_hints_enabled = 1
"let g:lsp_inlay_hints_mode = {
"\  'normal': ['always'],
"\}
"
"autocmd User lsp_setup call lsp#register_server({
"\   'name': 'gopls',
"\   'cmd': ['gopls'],
"\   'allowlist': ['go'],
"\   'initialization_options': {
"\     'ui.inlayhint.hints': {
"\         'assignVariableTypes': v:false,
"\         'compositeLiteralFields': v:false,
"\         'compositeLiteralTypes': v:false,
"\         'constantValues': v:false,
"\         'functionTypeParameters': v:true,
"\         'parameterNames': v:true,
"\         'rangeVariableTypes': v:false,
"\     },
"\   }
"\ })
"" ~ End ~

" Vista <F8>
nmap <F8> :Vista<CR>

"" for indent guide
"let g:indentguides_spacechar = '┆'
"let g:indentguides_tabchar = '|'
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level= 2
"let g:indent_guides_guide_size= 1

" RainBow
let g:rainbow_active = 1 

" ObviousResize
noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>
let g:obvious_resize_default = 2
noremap <silent> <C-Up> :<C-U>ObviousResizeUp 5<CR>
let g:obvious_resize_run_tmux = 1


" rust
let g:rustfmt_autosave = 1


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

" end~~~

" Ada_languge_sever(LSP)
if executable('ada_language_server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ada_language_server',
        \ 'cmd': ['ada_language_server'],
        \ 'allowlist': ['ada'],
        \ 'workspace_config': {'ada': {
        \     'projectFile': "project.gpr",
        \     'scenarioVariables': {"ARCH": "x86_64-pc-linux-gnu"}}},
        \ })
endif

" C# Setting __ Omnisharp_commands Start~~
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
" let g:OmniSharp_want_snippet=1
"   End ~~~~~~ OmniSharp

" esc setting
inoremap jk <Esc>

" color setting
colorscheme jellybeans

" relative number line
set rnu

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" font&size setting
set guifont=MesloLGS_NF:h16

set encoding=utf-8

" Editor Language setting
let $LANG = 'en'

" backup folder setting
set undodir=~/.vimdata/undo//
set backupdir=~/.vimdata/backup//
set directory=~/.vimdata/swap//
```

<hr>

<br>

# vim 안에서 (:CocConfig)

```

{
  // rust-analyzer setting~
  "diagnostic.enable": true,
  "diagnostic.virtualText": true,
  "diagnostic.joinMessageLines": true,
  "diagnostic.checkCurrentLine": true,
  "diagnostic.messageTarget": "float",
  "diagnostic.level": "information",
  "suggest.autoTrigger": "none",
  "signature.enable": true,
  "coc.preferences.snippets.enable": true,
  "rust-analyzer.diagnostics.enable": true, 
  "rust-analyzer.inlayHints.enable": true,
  "rust-analyzer.inlayHints.chainingHints": true,
  "rust-analyzer.inlyHints.parameterHints": true,
  "rust-analyzer.cargo.loadOutDirsFromCheck": true,
  "rust-analyzer.procMacro.enable": true,

  "languageserver": {
     "csharp-ls": {
          "command": "csharp-ls",
          "filetypes": ["cs"],
          "rootPatterns": ["*.csproj", ".vim/", ".git/", ".hg/"]
        },
    "ada": {
      "settings": {
        "ada": {
          "projectFile": "gnat/vss_text.gpr"
        }
      },
      "command": "<path>/ada_language_server",
      "filetypes": [
        "ads",
        "adb",
        "ada"
      ]
    }
  }

}

```

<hr>

<br>

# 단서 (YouCompleteMe unavailable: unable to load Python)

https://stackoverflow.com/questions/61240101/youcompleteme-unavailable-unable-to-load-python

<br>


# 모든 언어를 무료로 공부할 수 있다.
출처 : stackoverflow.com 알게 된 링크

역시 갓 스택 오버플로우

https://stackoverflow.com/questions/38683512/why-git-shallow-clone-can-have-more-commits-than-depth/38683775#38683775

Github 주소
https://github.com/EbookFoundation/free-programming-books

EbookFoundation
https://ebookfoundation.github.io/free-programming-books/

