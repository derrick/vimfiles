" MISC
"-------------------------------------------------
syntax on                                  " Turn on syntax highlighting
filetype plugin indent on                  " Enable automatic filetype detection, filetype-specific plugins/indentation
set encoding=utf-8                         " UTF-8 encoding
set shell=bash                             " Use bash shell
set hidden                                 " Allow hiding buffers with unsaved changes without warning
set switchbuf=useopen                      " Don't re-open already opened buffers
"set history=1000                           " Remember more commands and search history
set listchars=tab:\»\ ,trail:·             " Set the invisible characters
set listchars+=extends:↦,precedes:↤
set list                                   " Show invisible characters
"set fillchars+=vert:\                      " Hide pipes on vertical splits
"set noesckeys                              " Disable extended key support (cursor keys, function keys). Improves <Esc> time dramatically.
"set timeoutlen=1000                        " The time in milliseconds that is waited for a mapped key sequence to complete.  Also used for key code sequences if ttimoutlen is negative
set ttimeoutlen=100                        " The time in milliseconds that is waited for a key code sequence to complete
set showcmd                                " Show incomplete cmds above the command line
set noshowmode                             " Hide current mode above command line (Shown in Powerline status bar)
set cmdheight=2                            " Make the command line a little taller
set ttyfast                                " Smoother screen redrawing
set lazyredraw                             " Don't redraw during macros, etc
set incsearch                              " Find the next match as we type the search
set ruler                                  " Show the cursor position all the time
set number                                 " Show line numbers
set norelativenumber
set numberwidth=5
"set nowrap                                 " Dont wrap lines
set vb t_vb=                               " Turn off bell
set t_ut=                                  " Disable Background Color Erase (BCE) so colorschemes render properly in tmux
set t_Co=256                               " Support for xterm with 256 colors (gets overriden in .gvimrc)
set mouse=                                 " Disable the mouse
set title                                  " Show title in terminal vim
"set linespace=3                            " Spacing between lines
set noswapfile                             " Disable creation of *.swp files
"set shortmess+=I                           " Disable splash screen
set noequalalways                          " Don't equalize when opening/closing windows


" HIGHLIGHTING
"-------------------------------------------------
"set cursorline                             " highlight the cursor line
set nocursorline
set hlsearch                               " Highlight searches
:nnoremap <ESC><ESC> :nohlsearch<cr>       " Clear the search highlighting with double escape
set showmatch                              " Briefly jump to a paren once it's balanced
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red



" ACCORDION WINDOWS
"-------------------------------------------------
if has('vim_starting')
  set winwidth=134
  set winminwidth=25
  " We have to have a winheight bigger than we want to set winminheight. But if
  " we set winheight to be huge before winminheight, the winminheight set will
  " fail.
  set winheight=5
  set winminheight=5
  set winheight=999
endif


" INDENTATION
"-------------------------------------------------
set shiftround
set shiftwidth=2                           " Number of spaces to use in each autoindent step
set tabstop=2                              " Two tab spaces
set softtabstop=2                          " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                              " Spaces instead of tabs for better cross-editor compatibility
set autoindent                             " Keep the indent when creating a new line
"set smarttab                               " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
"set cindent                                " Recommended setting for automatic C-style indentation
"set autoindent                             " Automatic indentation in non-C files


" AUTOCOMPLETE
"-------------------------------------------------
set path+=**                               " Search for files recursively from pwd
set wildmenu                               " Make tab completion act more like bash
set wildmode=longest:full                  " Tab complete to longest common string, like bash
set wildignore+=.git                       " Files to ignore during tab completion
set wildignore+=log/**
"set wildignore+=/vendor/rails/**
"set wildignore+=vendor/cache/**
"set wildignore+=tmp/**,**/tmp/**
"set wildignore+=solr/**,
set completeopt=longest,menu               " Complete to the longest unambiguous match and show a menu
"set complete=.,t


" MOVING AROUND / EDITING
"-------------------------------------------------
"set nostartofline                          " Avoid moving cursor to BOL when jumping around
"set virtualedit=all                        " Let cursor move past the last char
set scrolloff=3                            " Keep 3 context lines above and below the cursor
set backspace=indent,eol,start             " Allow backspacing over autoindent, EOL, and BOL
"set matchtime=2                            " (for only .2 seconds).
set autowriteall                           " Write the contents of the file on commands that leave the window


" BACKUPS
"-------------------------------------------------
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.backup
set nobackup
set nowritebackup


" PERSISTENT UNDO
"-------------------------------------------------
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000


" CODE FOLDING
"-------------------------------------------------
set foldmethod=syntax
set foldlevelstart=99                      " Expand all folds by default


" SEARCHING
"-------------------------------------------------
set ignorecase                             " Ignore case by default when searching
set smartcase                              " Switch to case sensitive mode if needle contains uppercase characters


" CUSTOM STATUS LINE
"-------------------------------------------------
" GRB: Put useful info in status line
":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ [LEN=%L]
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-13(\ %l,%c-%v\ %)%-21{strftime('%a\ %y.%m.%d\ %H:%M\')}%P
set laststatus=2                           " Always display the status line
set showtabline=2                          " Always show the tab line

" Save on FocusLost
"au FocusLost * :silent! wall

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif


packadd! matchit

