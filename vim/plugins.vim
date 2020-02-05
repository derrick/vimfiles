packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type':'opt'})

" Colorschemes
" ------------------------------------
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('romainl/flattened')
call minpac#add('sjl/badwolf')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('jnurmine/Zenburn')
call minpac#add('morhetz/gruvbox')


" Language/Framework Packages
" ------------------------------------
call minpac#add('prabirshrestha/async.vim')
call minpac#add('prabirshrestha/vim-lsp')

"call minpac#add('vim-syntastic/syntastic')
call minpac#add('roxma/nvim-yarp')
call minpac#add('roxma/vim-hug-neovim-rpc')
call minpac#add('Shougo/denite.nvim')
"call minpac#add('Shougo/unite.vim')
call minpac#add('wsdjeg/JavaUnit.vim')

call minpac#add('liuchengxu/vista.vim')
"call minpac#add( 'elzr/vim-json')
"call minpac#add( 'tpope/vim-haml')
"call minpac#add( 'nono/vim-handlebars')
"call minpac#add( 'mustache/vim-mustache-handlebars')
"call minpac#add( 'clones/vim-nginx')
"call minpac#add( 'tpope/vim-rails')
"call minpac#add( 'tpope/vim-rake')
"call minpac#add( 'vim-ruby/vim-ruby')
"call minpac#add( 'guns/vim-clojure-static')
"call minpac#add( 'tpope/vim-classpath')
"call minpac#add( 'timcharper/textile.vim')
"call minpac#add( 'tpope/vim-markdown')
"call minpac#add( 'jimenezrick/vimerl')
"call minpac#add( 'derekwyatt/vim-scala')
"call minpac#add( 'kchmck/vim-coffee-script')
"call minpac#add( 'tpope/vim-cucumber')
"call minpac#add( 'chrisbra/csv.vim')
"call minpac#add( 'chikamichi/mediawiki.vim')
"call minpac#add( 'vimwiki/vimwiki')
"call minpac#add( 'tbabej/taskwiki')                         " Integrate vimwiki task lists with Taskwarrior
"call minpac#add( 'jalvesaq/Nvim-R')
call minpac#add('slim-template/vim-slim')
call minpac#add('artur-shaik/vim-javacomplete2')
"call minpac#add('prabirshrestha/asyncomplete.vim') " Won't work without writing a Java-specifc integration


" call minpac#add(ins
" ------------------------------------
call minpac#add( 'tpope/vim-fugitive')       " Git integration
"call minpac#add( 'tpope/vim-speeddating')    " Increment timestamps and assorted time maths
call minpac#add( 'scrooloose/nerdtree')
call minpac#add( 'Xuyuanp/nerdtree-git-plugin')
call minpac#add( 'scrooloose/nerdcommenter') " Smart comment shortcuts
"call minpac#add( 'kien/ctrlp.vim')
call minpac#add( 'junegunn/fzf')
call minpac#add( 'jlanzarotta/bufexplorer')
call minpac#add( 'sjl/vitality.vim')
call minpac#add( 'tpope/vim-surround')
call minpac#add( 'tpope/vim-repeat')  " Let's vim-surround commands work with .
call minpac#add( 'duff/vim-scratch')
call minpac#add( 'tpope/vim-unimpaired')
call minpac#add( 'vim-airline/vim-airline')
call minpac#add( 'vim-airline/vim-airline-themes')
"call minpac#add( 'kana/vim-textobj-user')
"call minpac#add( 'kana/vim-textobj-lastpat')
"call minpac#add( 'jceb/vim-orgmode')
"call minpac#add( 'ntpeters/vim-better-whitespace')
"call minpac#add( 'godlygeek/tabular')
"call minpac#add( 'dhruvasagar/vim-table-mode')
"call minpac#add( 'blindFS/vim-taskwarrior')              " Vim interface to taskwarrior
"call minpac#add( 'vimoutliner/vimoutliner')
"call minpac#add( 'vladh/tagbar')
"call minpac#add( 'vim-voom/VOoM')



" for tracing highlight groups
"call minpac#add( 'gerw/vim-HiLinkTrace')
"call minpac#add( 'trapd00r/vim-highlight-default-highlight-groups')

"" Clojure call minpac#add(ins
"call minpac#add( 'vim-scripts/paredit.vim')
call minpac#add( 'guns/vim-sexp')
call minpac#add( 'tpope/vim-sexp-mappings-for-regular-people')
call minpac#add( 'guns/vim-clojure-static')
call minpac#add( 'guns/vim-clojure-highlight')
call minpac#add( 'tpope/vim-leiningen')
call minpac#add( 'tpope/vim-projectionist')
call minpac#add( 'tpope/vim-dispatch')
call minpac#add( 'tpope/vim-fireplace')  " fiREPLace
"call minpac#add( 'venantius/vim-eastwood')
call minpac#add( 'venantius/vim-cljfmt')
