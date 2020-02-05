augroup custom_autocmds
  autocmd!
  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

   "When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim

  "autocmd WinEnter * setlocal cursorline
  "autocmd WinLeave * setlocal nocursorline

  " This can get dangerous because saving a bad command
  " can break your vim, making it hard to undo the error
  "if has("autocmd")
    "autocmd BufWritePost .vimrc source $MYVIMRC
  "endif

  autocmd BufNewFile,BufRead *_spec.rb compiler rspec

  autocmd BufNewFile,BufRead *.tdql set filetype=sql
  autocmd BufNewFile,BufRead *.hql set filetype=sql

  " Enable spell check by default for git commits
  autocmd FileType gitcommit set spell

  autocmd FileType erlang set softtabstop=4
  autocmd FileType erlang set shiftwidth=4

  autocmd FileType python set foldmethod=indent

  autocmd FileType yaml set foldmethod=indent

  autocmd FileType qf set winheight=10

  autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
  autocmd FileType sass setlocal foldmethod=indent shiftwidth=2 tabstop=2
  autocmd FileType scss setlocal foldmethod=indent shiftwidth=2 tabstop=2

  "autocmd BufWritePre *.clj call ClojureSortRequire()

  " Java Omni-completion from the vim-javacomplete2 plugin
  autocmd FileType java setlocal omnifunc=javacomplete#Complete

augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

function! s:sexp_mappings() abort
  if !exists('g:sexp_loaded')
    return
  endif
  nmap <buffer> <localleader>o H>I<CR>
  nmap <buffer> <localleader>ao H)a<CR>
  nnoremap <buffer> <leader>r :Require<CR>
  nnoremap <buffer> <leader>R :Require!<CR>
endfunction
function! s:setup() abort
  augroup sexp_mappings_for_derrick
    autocmd!
    execute 'autocmd FileType' get(g:, 'sexp_filetypes', 'lisp,scheme,clojure') 'call s:sexp_mappings()'
  augroup END
endfunction

if has('vim_starting') && !exists('g:sexp_loaded')
  au VimEnter * call s:setup()
else
  call s:setup()
endif
