
" DEFAULT COLOURS FOR VIM - GVIMRC OVERRIDES THIS
"-------------------------------------------------

" Forces true colour on
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
 "g:solarized_termcolors= 16 | 256 g:solarized_termtrans = 0 | 1 g:solarized_degrade = 0 | 1 g:solarized_bold = 1 | 0 g:solarized_underline = 1 | 0 g:solarized_italic = 1 | 0 g:solarized_contrast = "normal"| "high" or "low" g:solarized_visibility= "normal"| "high" or "low"
"let g:solarized_termcolors=16 "Setting to 16 means it will rely on the terminal colorscheme, which I've also set to solarized
"let g:solarized_contrast="low"
"let g:solarized_italic = 1
"colorscheme solarized
"colorscheme jellybeans
"colorscheme wombat
"colorscheme wombat256mod
"colorscheme vividchalk
"colorscheme molokai
"let g:molokai_original = 1
"colorscheme mustang
"colorscheme clouds_midnight
"highlight NonText guibg=#060606
"highlight CursorLine guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0
"colorscheme flattened_dark
let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid

" Use a bar cursor for insert mode under iTerm
if exists('$TMUX')
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"" Comments in italics
highlight Comment cterm=italic

" BECAUSE IT LOOKS TOO MUCH LIKE MY CURSOR!!
highlight MatchParen cterm=underline ctermbg=none ctermfg=222

" A little transparency for the holidays...
"highlight Normal  ctermfg=244 ctermbg=none
"highlight Comment ctermfg=241
"highlight NonText ctermbg=none
"highlight LineNr  ctermbg=none
"highlight SpecialKey ctermbg=none ctermfg=241

"if (exists('+colorcolumn'))
  "set colorcolumn=80
  "highlight ColorColumn ctermbg=9
"endif

" Display the current highlighting group for the character under the cursor
nnoremap <F10> :echo "hi<"      . synIDattr(synID(line("."),col("."),1),"name")
      \       . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
      \       . "> lo<"    . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
      \       . ">"<CR>
