" NERDTree
nmap <Leader>d :NERDTreeToggle<CR>

" bind command-/ to toggle comment
" requires NERD Commenter to be installed
" nmap <D-/> <Leader>c<space>
" vmap <D-/> <Leader>c<space>
" imap <D-/> <C-O><Leader>c<space>

" Command-T
"let g:CommandTMatchWindowAtTop=1
"let g:CommandTMaxFiles=50000
" Open files with <leader>f
"map <leader>f :CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
"map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

" Custom Rails-specific Command-T mappings
"map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
"map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
"map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
"map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
"map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
"map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>

" ctrlp
let g:ctrlp_map = '<leader>f'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

" ZoomWin
map \\ :ZoomWin<cr>
