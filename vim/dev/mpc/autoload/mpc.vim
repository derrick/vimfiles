function! LargestNumber(no1, no2)
  return a:no1 == a:no2 ? 0 : a:no1 > a:no2 ? 1 : -1
endfunction

function! mpc#DisplayPlaylist()
  setlocal modifiable
  let playlist = mpc#GetPlaylist()
  call append(0, map(playlist, {i,e -> '  ' . e.title . e.artist . e.album}))
  silent $,$delete _
  cursor('$')
  setlocal nomodifiable
endfunction

function! mpc#GetPlaylist()
  let results = mpc#Mpc("mpc --format '%title% @%artist% @%album%' playlist")
  let playlist = []
  let maxLengths = {'title': [], 'artist': []}

  for item in results
    call add(playlist, mpc#EncodeSong(item))
  endfor

  for track in playlist
    call add(maxLengths['title'], len(track.title))
    call add(maxLengths['artist'], len(track.artist))
  endfor

  call sort(maxLengths.title, "LargestNumber")
  call sort(maxLengths.artist, "LargestNumber")

  for track in playlist
    let track.title .= repeat(' ', maxLengths['title'][-1] + 2 - len(track.title))
    let track.artist .= repeat(' ', maxLengths['artist'][-1] + 2 - len(track.artist))
  endfor
  return playlist
endfunction

function! mpc#EncodeSong(item)
  let item = split(a:item, " @")
  let song = {'title': '@ti' . item[0] . 'ti@',
           \  'artist': '@ar' . item[1] . 'ar@',
           \  'album': '@al' . item[2] . 'al@'}
  return song
endfunction

function! mpc#PlaySong(no)
  echomsg '[mpc] NOW PLAYING: '
        \ . mpc#Mpc("mpc --format '%title% (%artist%)' play " . a:no)[0]
endfunction

function! mpc#TogglePlayback()
  let result = mpc#Mpc('mpc toggle')[1]

  let message = '[mpc] '
  let message .= split(result, ' ')[0] == '[paused]' ? 'PAUSED' : 'PLAYING'
  echomsg message
endfunction!

function! mpc#ToggleRandom()
  let result = mpc#Mpc('mpc random')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[2] == 'random: off' ? '[mpc] RANDOM: OFF' : '[mpc] RANDOM: ON'
  echomsg message
endfunction

function! mpc#ToggleRepeat()
  let result = mpc#Mpc('mpc repeat')

  let status = len(result) == 3 ? result[2] : result[0]
  let message = split(status, '   ')[1] == 'repeat: off' ? '[mpc] REPEAT: OFF' : '[mpc] REPEAT: ON'
  echomsg message
endfunction

function! mpc#Mpc(cmd)
  return split(system(a:cmd), '\n')
endfunction

function! mpc#ToggleSelectTrack()

endfunction
