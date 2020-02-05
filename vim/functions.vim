" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
"function! CSVH(colnr)
  "if a:colnr > 1
    "let n = a:colnr - 1
    "execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    "execute 'normal! 0'.n.'f,'
  "elseif a:colnr == 1
    "match Keyword /^[^,]*/
    "normal! 0
  "else
    "match
  "endif
"endfunction
"command! -nargs=1 Csv :call CSVH(<args>)

function! ClojureToggleDispatchIgnore()
  if (strpart(getline('.'), col('.')-3, 2) == '#_')
    normal! 2h2x
  else
    execute "normal! I#_\<ESC>l"
  endif
endfunction

function! ClojureToggleDispatchIgnoreElement()
  " Move to the beginning of the element
  execute "normal vie\<ESC>B"
  "call ClojureToggleDispatchIgnore()
endfunction!

function! ClojureToggleDispatchIgnoreForm()
  " Move to the beginning of the form
  if !(getline('.')[col('.')-1] == '(')
    normal (
  endif
  call ClojureToggleDispatchIgnore()
endfunction!

function! ClojureSortRequire()
  let l:winview = winsaveview()
  global /(:require/ :normal f(vi)oW"ry
  let l:requires = split(@r,'\n\s*')
  let l:sorted = sort(deepcopy(l:requires))
  if !(l:requires == l:sorted)
    let @s = join(l:sorted, "\n")
    normal gv"spgv=
  endif
  call winrestview(l:winview)
  :nohlsearch
endfunction

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
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
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


" Show the highlight groups active under the cursor
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
"map <F10> :echo SyntaxItem() <CR>

function! SynStack()
  let sstack = map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
  echo sstack
endfunc
nmap <F10> :call SynStack()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    let in_test_file = match(expand("%"), '_spec.rb$') != -1
    if !in_test_file
      let in_test_file = match(expand("%"), '_test.clj$') != -1
    end

    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if filereadable("project.clj")
      exec ":!env ACTIVE_ENV=test lein test " . a:filename
    elseif match(a:filename, '\.feature$') != -1
      exec ":!script/features " . a:filename
    elseif filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("script/spec")
      exec ":!bundle exec script/spec " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
endfunction
