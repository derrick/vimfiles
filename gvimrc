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

  map <D-1> :tabn 1<CR>
  map <D-2> :tabn 2<CR>
  map <D-3> :tabn 3<CR>
  map <D-4> :tabn 4<CR>
  map <D-5> :tabn 5<CR>
  map <D-6> :tabn 6<CR>
  map <D-7> :tabn 7<CR>
  map <D-8> :tabn 8<CR>
  map <D-9> :tabn 9<CR>

  nmap <D-]> >>
  vmap <D-]> >>
  imap <D-]> <C-O>>>

  nmap <D-[> <<
  vmap <D-[> <<
  imap <D-[> <C-O><<


  inoremap <D-CR> <C-O>o

end
