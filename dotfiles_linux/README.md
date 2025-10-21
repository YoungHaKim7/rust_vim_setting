# 다른 외국인 dotfiles sample
- https://github.com/richardscollin/.dotfiles

# ANSI Color Codes
- https://talyian.github.io/ansicolors/

# Reselt :  

https://gist.github.com/schulace/528eb7b91d9f1bc361922bfc86081a53

# NeoVim _____code action key setting

```

"  NERDTree Setting " 숨김 파일 표시 I - 숨긴 파일 보기 / R - Reflash / m - 파일 지울지 추가할지 메뉴 보기
let NERDTreeShowHidden=1
"  ~~~~~~~~


"  ~~~~~~~~~~~~~~~~~~~~~~
"  YouCompleteMe Setting
"  ~~~~~~~~~~~~~~~~~~~~~~
" let g:ycm_key_list_select_completion = ['<C-n>']
" let g:ycm_key_list_previous_completion=['<C-p>']

let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_filetype_blacklist = {}
set signcolumn=yes


"  ~~~~~~~~~~~~~~~~~~~~~~
" asyncomplete.vim
"  ~~~~~~~~~~~~~~~~~~~~~~
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
" Or use `complete_info` if your vim support it, like:

"  ~~~~~~~~~~~~~~~~~~~~~~
" asyncomplete.vim end~~~
"  ~~~~~~~~~~~~~~~~~~~~~~


"  ~~~~~~~~~~~~~~~~~~~~~~
" Vista Setting~~
"  ~~~~~~~~~~~~~~~~~~~~~~
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
"  ~~~~~~~~~~~~~~~~~~~~~~
"" ~ End ~
"  ~~~~~~~~~~~~~~~~~~~~~~

" Vista <F8>
nmap <F8> :Vista<CR>


" RainBow
let g:rainbow_active = 1 


" rust
let g:rustfmt_autosave = 1


"  ~~~~~~~~~~~~~~~~~~~~~~
" rust analyzer start~~~~~~:w
"  ~~~~~~~~~~~~~~~~~~~~~~
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
"  ~~~~~~~~~~~~~~~~~~~~~~
"  ~~~~~~~~~~~~~~~~~~~~~~





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
"
""~~~~ Buffer   :bn next :bp previous   :bd buffer delete(close)
nmap <silent> <Leader>b :buffers<CR>
nmap <silent> <Leader>l <C-w>gt<CR>
nmap <silent> <Leader>h <C-w>gT<CR>
nmap <silent> <Leader>j :tabfirst<CR>
nmap <silent> <Leader>k :tablast<CR>
nnoremap <silent><nowait> <space>t  :<C-u>tabnew<CR>
nnoremap <silent><nowait> <space>n  :<C-u>bn<CR>
nnoremap <silent><nowait> <space>p  :<C-u>bp<CR>

" ~~~highlight Rust-analyzer
nnoremap <silent><nowait> <space>h  :<C-u>:hi CocInlayHint ctermbg=53 <CR>

" Move visually selected lines up or down in various modes.
" nnoremap K :m .-2<CR>==    " "" Normal모드에서 되는거 싫어서 주석처리함  """
" nnoremap J :m .+1<CR>==
""""" Visual mode로 블럭 칠해 주고 칠해 준 부분만 움직이게 쎄팅.. 잘못 눌러서 움직임 방지 """"
vnoremap K :m '<-2<CR>gv==gv
vnoremap J :m '>+1<CR>gv==gv

"~~~~~~~~~
" Set End
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



```
