" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source $HOME/.vim/vundle.vim
source $HOME/.vim/functions.vim
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

" Use a bar cursor for insert mode under iTerm
if exists('$TMUX')
  let &t_SI = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[0 q"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
