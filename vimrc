" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source $HOME/.vim/vundle.vim
source $HOME/.vim/settings.vim
source $HOME/.vim/keybindings.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/autocmd.vim
source $HOME/.vim/test_runners.vim
source $VIM/vim73/macros/matchit.vim

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

