nmap <space> zz                            " Use space to center window in normal mode

" The directory of the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Make search results move to center of screen
nmap n nzz
nmap N Nzz

" Because F1 is so dog-gone close to the esc key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast and easy window resizing
nnoremap <silent> + :exe "resize" . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize" . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-m> :exe "vertical resize" . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <C-n> :exe "vertical resize" . (winwidth(0) * 2/3)<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>et :tabe %%


" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>


" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>


" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Insert a hash rocket
imap <C-l> <Space>=><Space>

