function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  if s:uri != ""
    let s:uri = escape (s:uri, "#?&;|%")
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

function! GreenHerbIngredientList()
  execute ":%s:\\v^((\\u|\\s|\\d|\\%)+(\\u|\\d|\\%))\\s*-\\s*(.*)$:  <dt>\\1</dt>\r  <dd>\\4</dd>:g"
endfunction

" Maps autocomplete to tab
" imap <Tab> <C-N>
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
