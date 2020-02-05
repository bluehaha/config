call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'            " Git wrapper
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " Display files and directories in the form of a tree
Plug 'terryma/vim-multiple-cursors'   " Multiple selection
" Plug 'storyn26383/vim-autoclose'      " Auto close quote, double quote, brace ... etc.
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'            " Easy to use, file-type sensible comments for Vim.
Plug 'tpope/vim-surround'             " Easily delete, change and add such surroundings in pairs
" Plug 'junegunn/vim-easy-align'        " A simple, easy-to-use Vim alignment plugin
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'      " UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.  "
Plug 'honza/vim-snippets'  " Snippets are separated from the engine. Add this if you want them:
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'digitaltoad/vim-pug'
" Plug 'jwalton512/vim-blade'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'lilydjwg/colorizer'
Plug 'storyn26383/emmet-vim'
Plug 'storyn26383/vim-vue'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" vim color theme
Plug 'tomasiser/vim-code-dark'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" markdown editor tool
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()     " Original Setting
syntax on
set t_Co=256
set t_ut=
" colorscheme codedark
" let g:airline_theme = 'codedark'
colorscheme tomorrow-night
" leader key
let mapleader = ","
let g:mapleader = ","
" General
set laststatus=2
set number	" Show line numbers
set nowrap	" Wrap lines
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set noswapfile
set encoding=utf8
set fileencoding=utf-8
set scrolloff=10
" set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
set autoread
" search
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
" indent
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
" set smartindent	" Enable smart-indent
" set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set tabstop=4
set tags+=~/.vim/tags,./tags,tags;
set hidden " leave buffer without save
autocmd FileType make setlocal noexpandtab
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType typescript,js,javascript,json,vue,css,html,pug,scss setlocal sw=2 sts=2 ts=2
" Advanced
set ruler	" Show row and column ruler information
set autowriteall	" Auto-write all file changes
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
" ------------------------- airline -----------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
" ------------------------- NERDTree ----------------------------
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
:if argc() == 0 && !exists("s:std_in")
:autocmd vimenter * NERDTree
:endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") <= 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle NERDTree
nmap <silent> <Leader>b :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1      " disables the 'Bookmarks' label 'Press ? for help' text
let NERDTreeShowHidden = 1   " display hidden files on startup.
let NERDTreeIgnore = ['\.git$', '\.DS_Store$']
" ------------------------- Basic Setting -----------------------
" fast save
map <Leader>s :w<CR>
" fase quip
map <Leader>q :q<CR>
" copy to gloabl
vmap <Leader>y "*y
" cancel searched highlight
nmap <Leader><Space> :nohlsearch<CR>
" move lines up and down using ctrl+[jk]
nmap <C-K> :m-2<CR>`z
nmap <C-J> :m+<CR>`z
vmap <C-J> :m'>+<CR>`<my`>mzgv`yo`z
vmap <C-K> :m'<-2<CR>`>my`<mzgv`yo`z
" move to the prev or next buffer using ctrl+[hl]
nmap <C-H> :bprevious<CR>
nmap <C-L> :bnext<CR>
nmap <C-O> :Buffers<CR>
" go to previous buffer &  close the last buffer
nmap <Leader>w :bp\|bd #<CR>
" close all buffer and open last one
nmap <Leader>ww :%bd\|e#<CR>
" delete all buffer & open previous buffer
nmap <Leader>d :%bd\|e#<CR>
" fzf
nmap <C-P> :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :BTags<CR>
" Automatically strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
" Set fold method
set foldmethod=indent
set foldlevel=20
" Insert one character only
:nnoremap <Leader>i i_<Esc>r
:nnoremap <Leader>a a_<Esc>r
" --------------------------- PHP -------------------
" php cs fixer
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_enable_default_mapping = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=psr2'
autocmd FileType php nmap <leader>pf :call PhpCsFixerFixFile()<CR>
"" ------- phpactor -------
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" vue
" let g:tcomment#filetype#guess_vue = 'pug'
" let g:user_emmet_settings = { 'vue': { 'extends': 'css' } }
"--------------------------- ultisnips -------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" =================
"  base16 theme
" =================
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  let g:airline_theme = 'base16'
  source ~/.vimrc_background
endif
" ctags
nmap <Leader>c :!ctags --recurse --kinds-php=citf &<CR>
" tmp fix bug
let g:vim_markdown_fenced_languages = ['php=javascript']
