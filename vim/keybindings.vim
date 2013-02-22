let mapleader = ","                        " Define <Leader>

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

" Quick splits
nmap <silent> <leader>v :vsplit<CR><C-w>l
nmap <silent> <leader>s :split<CR><C-W>j

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

map <Leader>r :!ruby %


map <Leader>w :call HandleURI()<CR>
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Mapping to open specific Rails files
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gR :call ShowRoutes()<cr>

" *****************************************************************************
" Unknown stuff I found lying around ... what does it mean? *******************
" *****************************************************************************

"nmap <leader>w <C-w><C-w>_
"nnoremap <leader><Space> :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <leader>v V`] Visual Line mode select to the last character of the previously changed or yanked text.

"map <buffer> <silent> <Leader>td <Plug>ToggleDone
"map <buffer> <silent> <Leader>tc <Plug>ShowContext
"map <buffer> <silent> <Leader>ta <Plug>ShowAll
"map <buffer> <silent> <Leader>tp <Plug>FoldAllProjects

"compiler rubyunit
"nnoremap <Leader>fd :cf /tmp/autotest.txt<cr> :compiler rubyunit<cr>
