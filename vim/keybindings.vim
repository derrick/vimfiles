let mapleader = ","                        " Define <Leader>
let maplocalleader = "m"

" ------------------------------------------------------------------------------
" Operator Pending Mode Mappings
" ------------------------------------------------------------------------------
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" ------------------------------------------------------------------------------
" Visual Mode Mappings
" ------------------------------------------------------------------------------
" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vnoremap P p\|:call setreg('"', getreg('0'))<CR>
" Duplicate a selection
"vnoremap D y'>p
vnoremap <Space> zf
"vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv
"vmap <silent> <S-Up> [egv
"vmap <silent> <S-Down> ]egv
" RESELECT "VISUAL" BLOCK AFTER IN/OUTDENT
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>gvll


" ------------------------------------------------------------------------------
" Insert Mode Mappings
" ------------------------------------------------------------------------------
" Insert a hash rocket
inoremap <C-l> <Space>=><Space>
" Uppercase the current word
inoremap <C-u> <ESC>viwUea
" Press ^F from insert mode to insert the current file name
"inoremap <C-F> <C-R>=expand("%")<CR>


" ------------------------------------------------------------------------------
" Command Mode Mappings
" ------------------------------------------------------------------------------
" The directory of the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>


" ------------------------------------------------------------------------------
" Normal Mode Mappings
" ------------------------------------------------------------------------------

" Edit my vimrc
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Swap H and ^
nnoremap H ^
nnoremap ^ H

" Swap L and $
nnoremap L $
nnoremap $ L

" Swap : and ;
nnoremap ; :
nnoremap : ;

" Make search results move to center of screen
nnoremap n nzz
nnoremap N Nzz

" Because F1 is so dog-gone close to the esc key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" In fact, just don't even reach for ESC...
"inoremap <F1> <nop>
"inoremap <ESC> <nop>
inoremap jk <ESC>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick splits
nnoremap <silent> <leader>v :vsplit<CR><C-w>l
nnoremap <silent> <leader>s :split<CR><C-W>j

" Fast and easy window resizing
"nnoremap <silent> + :exe "resize" . (winheight(0) * 3/2)<CR>
"nnoremap <silent> _ :exe "resize" . (winheight(0) * 2/3)<CR>
"nnoremap <silent> <C-m> :exe "vertical resize" . (winwidth(0) * 3/2)<CR>
"nnoremap <silent> <C-n> :exe "vertical resize" . (winwidth(0) * 2/3)<CR>

" Opens an edit command with the path of the currently edited file filled in
"noremap <Leader>e :e %%
"noremap <Leader>es :sp %%
"noremap <Leader>ev :vsp %%
"noremap <Leader>et :tabe %%

"noremap <Leader>r :!ruby %

"nnoremap <space> zz                            " Use space to center window in normal mode
nnoremap <CR> zz
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<C-D>")<CR>
"nnoremap <Space> <C-D>


"noremap <Leader>w :call HandleURI()<CR>
"inoremap <Tab> <C-R>=InsertTabWrapper()<CR>
"inoremap <S-Tab> <C-N>

" Mapping to open specific Rails files
noremap <leader>gr :topleft :split config/routes.rb<cr>
noremap <leader>gg :topleft 100 :split Gemfile<cr>
noremap <leader>gR :call ShowRoutes()<cr>

" Bubble single lines
"nmap <silent> <S-Up> [e
"nmap <silent> <S-Down> ]e
" Bubble multiple lines



" TEST RUNNING
"-------------------------------------------------
noremap <leader>t :call RunTestFile()<cr>
noremap <leader>T :call RunNearestTest()<cr>
noremap <leader>ta :call RunTests('')<cr>
"map <leader>c :w\|:!script/features<cr>
"map <leader>w :w\|:!script/features --profile wip<cr>

nnoremap <leader>. :call OpenTestAlternate()<cr>

" *****************************************************************************
" Unknown stuff I found lying around ... what does it mean? *******************
" *****************************************************************************

"nmap <leader>w <C-w><C-w>_
"nnoremap <leader><Space> :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <leader>v V`] Visual Line mode select to the last character of the previously changed or yanked text.

