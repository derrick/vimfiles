function! OpenMPC()
  if(bufexists('MPC_BROWSER'))
    let mpcwinnr = bufwinnr('MPC_BROWSER')
    if(mpcwinnr == -1)
      execute "sbuffer " . bufnr('MPC_BROWSER')
    else
      execute mpcwinnr . 'wincmd w' | return
    endif
  else
    silent! execute 'keepalt botright 10new MPC_BROWSER'
  endif
  call mpc#DisplayPlaylist()
endfunction

command! MpcBrowser call OpenMPC()
command! TogglePlayback call mpc#TogglePlayback()
command! TrackNext call mpc#TogglePlayback()
command! TrackPrev call mpc#TogglePlayback()
command! TrackStart call mpc#TogglePlayback()

nnoremap <silent> <plug>MpcOpenbrowser :MpcBrowser<CR>
nnoremap <silent> <plug>MpcToggleplayback :TogglePlayback<CR>
nnoremap <silent> <plug>MpcNext :TogglePlayback<CR>
nnoremap <silent> <plug>MpcBack :TogglePlayback<CR>

if !hasmapto("<plug>MpcToggleplayback")
  nmap <leader>m<space> <plug>MpcToggleplayback
endif

if !hasmapto("<plug>MpcOpenbrowser")
  nmap <leader>m <plug>MpcOpenbrowser
endif

