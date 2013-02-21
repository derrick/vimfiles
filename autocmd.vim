" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For Haml
  au! BufRead,BufNewFile *.haml setfiletype haml


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

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

  augroup END

endif

