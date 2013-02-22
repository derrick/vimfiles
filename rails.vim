" Mapping to open specific Rails files
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
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
map <leader>gR :call ShowRoutes()<cr>

function! RestartRailsApp()
  exec "!touch tmp/restart.txt"
endfunction
map <Leader>rr :call RestartRailsApp()<CR>


function! RedoMigration(args)
  let ver = matchstr(getreg("%"),'\<db/migrate/0*\zs\d*\ze_')
  execute ":! rake db:migrate:redo VERSION=".ver
endfunction

map !m :call RedoMigration("")

