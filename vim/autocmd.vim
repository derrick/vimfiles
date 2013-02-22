" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd BufNewFile,BufRead *.xml source ~/.vim/ftplugin/xml.vim

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" This can get dangerous because saving a bad command
" can break your vim, making it hard to undo the error
"if has("autocmd")
  "autocmd BufWritePost .vimrc source $MYVIMRC
"endif

autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Enable spell check by default for git commits
autocmd FileType gitcommit set spell
