if has("gui_running")
  set fuoptions=maxvert,maxhorz
  "au GUIEnter * set fullscreen

  " Font
  "set guifont=Monaco:h12.00
  set guifont=Menlo:h14.00
  "set guifont=Inconsolata-dz:h14.00

  " No toolbar
  set guioptions-=T

  " No scrollbars
  set guioptions-=rL

  " Don't use gui tabs
  set guioptions-=e

  " Use console dialogs
  set guioptions+=c

  set lines=50 columns=120

  set transparency=15

  " Local config
  if filereadable(".gvimrc.local")
    source .gvimrc.local
  endif

  if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> <Plug>PeepOpen
  end
end
