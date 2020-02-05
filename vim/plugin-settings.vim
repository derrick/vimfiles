" netrw
let g:netrw_banner=0        " remove the banner
let g:netrw_liststyle=3     " tree view
let g:netrw_preview= 1      " preview window opens in vertical split
let g:netrw_browse_split=4  " <cr> will behave like P
let g:netrw_winsize= 70     " netrw will use 30% of screen columns
let g:netrw_altv=1          " open splits to the right
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NERDTree
let NERDTreeHighlightCursorline=0
let g:NERDTreeShowIgnoredStatus=1
let g:NERDTreeWinSize=40
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>x :NERDTreeFind<CR>

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
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU"], v:count)'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['Gemfile']
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 5

" FZF
nnoremap <leader>f :<C-u>FZF<cr>

" ZoomWin
"map \\ :ZoomWin<cr>

" Better whitespace
let g:strip_whitespace_on_save=1

" Powerline
"set rtp+=/Users/derrick/vimfiles/vim/bundle/powerline/powerline/bindings/vim

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='luna'

" Syntastic!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_filetype_map = { "html.handlebars": "handlebars" }

" vim-cljfmt
let g:clj_fmt_autosave=0

" vim-clojure-static
let g:clojure_align_multiline_strings = 1
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defui'

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.markdown'}]

" Nvim-R
" Remove mapping that makes it impossible to type underscores
"augroup correct_bad_nvim_r_mappings
  "autocmd FileType r iunmap <buffer> _
"augroup END

" Vim Table Mode
" Set the table corners to be markdown compatible
let g:table_mode_corner='|'
let g:table_mode_update_time = 1500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" vim-lsp
if executable('java') && filereadable(expand('~/dev/lsp/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.5.400.v20190515-0925.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/dev/lsp/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.5.400.v20190515-0925.jar'),
        \     '-configuration',
        \     expand('~/dev/lsp/jdt-language-server-latest/config_mac'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vista.vim
nnoremap <leader>a :Vista!!<CR>

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'java': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
"let g:vista_ctags_cmd = {
      "\ 'haskell': 'hasktags -x -o - -c',
      "\ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
"let g:vista_fzf_preview = ['right:50%']

let g:vista_sidebar_width = 45

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista#renderer#icons = {
\   'subroutine': '',
\   'method': '',
\   "func": "\uf794",
\   'variables': '',
\   'namespace': '',
\   'field': '',
\   'interface': '',
\   'type': '',
\   'packages': '',
\   'property': '',
\   'implementation': ' ',
\   'default': '',
\   'augroup': '',
\   'macro': '',
\   'enumerator': '',
\   'const': '',
\   'constant': '',
\   'macros': '',
\   'map': '',
\   'fields': '',
\   "functions": "\uf794",
\   'enum': '',
\   "function": "\uf794",
\   'target': '',
\   'typedef': '',
\   'variable': '',
\   'modules': '',
\   'module': '',
\   'struct': '',
\   'types': '',
\   'typeParameter':'',
\   'package': '',
\   'class': '',
\   'member': '',
\   'var': '',
\   'union': '',
\  }


""" vim-javacomplete2 *****************************************************************
" .. *sigh* .. none of these mappings are working....
"" To enable smart (trying to guess import option) inserting class imports with F4
"nnoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"inoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"" To enable usual (will ask for import option) inserting class imports with F5
"nnoremap <F5> <Plug>(JavaComplete-Imports-Add)
"inoremap <F5> <Plug>(JavaComplete-Imports-Add)

"" To add all missing imports with F6
"nnoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"inoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"" To remove all unused imports with F7
"nnoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"inoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
