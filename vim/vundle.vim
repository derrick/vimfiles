filetype off   " required! will be reset in global.vim, after bundles load

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'


" Plugins
" ------------------------------------
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/ZoomWin'
Bundle 'sjl/vitality.vim'
"Bundle 'mileszs/ack.vim'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-repeat'
"Bundle 'duff/vim-scratch'


" Colorschemes
" ------------------------------------
Bundle 'nanotech/jellybeans.vim'


" Language/Framework Packages
" ------------------------------------
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-cucumber'
Bundle 'timcharper/textile.vim'
Bundle 'clones/vim-nginx'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'

