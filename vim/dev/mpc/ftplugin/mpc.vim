function! GetMPCStatusLine()
  let result = split(system('mpc status'),'\n')
  let status = len(result) == 3 ? result[2] : result[0]

  let [s:count, s:settings] = [len(split(system('mpc playlist'), '\n')),
                              \split(status, '   ')]

  let s:statusline = " "
    \ . s:settings[1] . " --- "
    \ . s:settings[2] . " ---%="
    \ . s:count . " songs "

  return s:statusline
endfunction

set buftype=nofile
setlocal nomodifiable
setlocal statusline=%!GetMPCStatusLine()
setlocal conceallevel=3
setlocal concealcursor=nvic
setlocal nowrap
setlocal number norelativenumber

command! -buffer PlaySelectedSong call mpc#PlaySong(line("."))
command! -buffer TogglePlayback call mpc#TogglePlayback()
command! -buffer ToggleRandom call mpc#ToggleRandom()
command! -buffer ToggleRepeat call mpc#ToggleRepeat()

nnoremap <silent> <buffer> <CR> :PlaySelectedSong<CR>
nnoremap <silent> <buffer> <space> :TogglePlayback<CR>
nnoremap <silent> <buffer> <C-a> :ToggleRandom<CR>
nnoremap <silent> <buffer> <C-e> :ToggleRepeat<CR>

nnoremap <buffer> x I<C-k>OK<ESC>

