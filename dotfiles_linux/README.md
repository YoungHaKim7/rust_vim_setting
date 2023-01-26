# Reselt :  

https://gist.github.com/schulace/528eb7b91d9f1bc361922bfc86081a53

# NeoVim _____code action key setting

```

" Leader Key Setting & coc-actions
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

  Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language
  server.
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
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv==gv
vnoremap J :m '>+1<CR>gv==gv

"~~~~~~~~~
" Set End
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


```
