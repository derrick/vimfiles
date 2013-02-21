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


" Colorschemes
" ------------------------------------
Bundle 'nanotech/jellybeans.vim'
