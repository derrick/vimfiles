" MISC
"-------------------------------------------------
syntax on                                  " Turn on syntax highlighting
filetype plugin indent on                  " Enable automatic filetype detection, filetype-specific plugins/indentation
set encoding=utf-8                         " UTF-8 encoding
"set shell=bash                             " Use bash shell
set hidden                                 " Allow hiding buffers with unsaved changes without warning
"set history=1000                           " Remember more commands and search history
set listchars=tab:\»\ ,trail:·             " Set the invisible characters
set listchars+=extends:↦,precedes:↤
set list                                   " Show invisible characters
set fillchars+=vert:\                      " Hide pipes on vertical splits
set noesckeys                              " Disable extended key support (cursor keys, function keys). Improves <Esc> time dramatically.
set showcmd                                " Show incomplete cmds down the bottom
" set showmode                               " Show current mode down the bottom
set cmdheight=2                            " Make the command line a little taller
set ttyfast                                " Smoother screen redrawing
set lazyredraw                             " Don't redraw during macros, etc
set incsearch                              " Find the next match as we type the search
set ruler                                  " Show the cursor position all the time
set number                                 " Show line numbers
set numberwidth=5
" set nowrap                                 " Dont wrap lines
set vb t_vb=                               " Turn off bell
set mouse=                                 " Disable the mouse
set title                                  " Show title in terminal vim
" set linespace=3                            " Spacing between lines
" set noswapfile                             " Disable creation of *.swp files
" set t_Co=256                               " Support for xterm with 256 colors (gets overriden in .gvimrc)
set shortmess+=I                           " Disable splash screen
set noequalalways                          " Don't equalize when opening/closing windows


" HIGHLIGHTING
"-------------------------------------------------
set cursorline                             " highlight the cursor line
set hlsearch                               " Highlight searches
:nnoremap <ESC><ESC> :nohlsearch<cr>       " Clear the search highlighting with double escape
set showmatch                              " Briefly jump to a paren once it's balanced


" ACCORDION WINDOWS
"-------------------------------------------------
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999


" INDENTATION
"-------------------------------------------------
set shiftwidth=2                           " Number of spaces to use in each autoindent step
set tabstop=2                              " Two tab spaces
set softtabstop=2                          " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                              " Spaces instead of tabs for better cross-editor compatibility
set autoindent                             " Keep the indent when creating a new line
" set smarttab                               " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
" set cindent                                " Recommended setting for automatic C-style indentation
" set autoindent                             " Automatic indentation in non-C files


" AUTOCOMPLETE
"-------------------------------------------------
set wildmenu                               " Make tab completion act more like bash
set wildignore+=.git                       " Files to ignore during tab completion
set wildignore+=log/**
set wildignore+=/vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=tmp/**,**/tmp/**
set wildignore+=solr/**,
set wildmode=list:longest,list:full        " Tab complete to longest common string, like bash
set completeopt=longest,menu               " Complete to the longest unambiguous match and show a menu
set complete=.,t
set switchbuf=useopen                      " Don't re-open already opened buffers


" MOVING AROUND / EDITING
"-------------------------------------------------
" set nostartofline                          " Avoid moving cursor to BOL when jumping around
"set virtualedit=all                        " Let cursor move past the last char
set scrolloff=3                            " Keep 3 context lines above and below the cursor
set backspace=indent,eol,start             " Allow backspacing over autoindent, EOL, and BOL
" set matchtime=2                            " (for only .2 seconds).


" BACKUPS
"-------------------------------------------------
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.backup
set nobackup
set nowritebackup


" PERSISTENT UNDO
"-------------------------------------------------
" set undodir=$HOME/.vim/undodir
" set undofile
" set undolevels=1000
" set undoreload=10000


" CODE FOLDING
"-------------------------------------------------
set foldmethod=syntax
set foldlevelstart=99                      " Expand all folds by default
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType sass setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType scss setlocal foldmethod=indent shiftwidth=2 tabstop=2


" SEARCHING
"-------------------------------------------------
set ignorecase                             " Ignore case by default when searching
set smartcase                              " Switch to case sensitive mode if needle contains uppercase characters


" DEFAULT COLOURS FOR VIM - GVIMRC OVERRIDES THIS
"-------------------------------------------------
 colorscheme jellybeans
" colorscheme wombat
"colorscheme wombat256mod
"colorscheme vividchalk
"colorscheme molokai
"let g:molokai_original = 1
"colorscheme mustang
"colorscheme clouds_midnight
"highlight NonText guibg=#060606
"highlight CursorLine guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0


" CUSTOM STATUS LINE
"-------------------------------------------------
" GRB: Put useful info in status line
":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
" set statusline=%F%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ [LEN=%L]
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-13(\ %l,%c-%v\ %)%-21{strftime('%a\ %y.%m.%d\ %H:%M\')}%P
set laststatus=2                           " Always display the status line
set showtabline=2                          " Always show the tab line

" Save on FocusLost
" au FocusLost * :silent! wall

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif



" *****************************************************************************
" Unknown stuff I found lying around ... what does it mean? *******************
" *****************************************************************************
" 
" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

