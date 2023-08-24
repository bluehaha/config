call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " Display files and directories in the form of a tree
Plug 'terryma/vim-multiple-cursors'   " 同樣的字段可以多選
Plug 'jiangmiao/auto-pairs'           " 自動產生對稱的括號
Plug 'tpope/vim-surround'             " 好刪除、轉換括號

Plug 'tomtom/tcomment_vim'            " 根據檔案類型產生註解
" Plug 'junegunn/vim-easy-align'        " 自動對齊插件
" Plug 'ervandew/supertab'              " tab 補齊插件

" Plug 'SirVer/ultisnips'      " UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.  "
" Plug 'honza/vim-snippets'  " Snippets are separated from the engine. Add this if you want them:

Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" Plug 'storyn26383/vim-vue'
" Plug 'digitaltoad/vim-pug'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'wavded/vim-stylus'
" html, js, css, vue 相關
Plug 'posva/vim-vue'
Plug 'lilydjwg/colorizer'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'scrooloose/syntastic'

" git 相關
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" vim color theme
" Plug 'tomasiser/vim-code-dark'

" markdown editor tool
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" 智能補齊插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set hidden " leave buffer without save
autocmd FileType make setlocal noexpandtab
autocmd FileType c colorscheme hybrid
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType typescript,js,javascript,json,vue,css,html,pug,scss,yml setlocal sw=2 sts=2 ts=2
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
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.phpcd']
let NERDTreeWinSize=35
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
noremap <C-T> <C-O>      " 將原本 <C-O> jumps back 的功能綁定到 <C-T>
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
let g:php_cs_fixer_level = 'psr12'
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
" " Include use statement
" nmap <Leader>u :call phpactor#UseAdd()<CR>
" " Invoke the context menu
" nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" " Invoke the navigation menu
" nmap <Leader>nn :call phpactor#Navigate()<CR>
" " Goto definition of class or class member under the cursor
" nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" " Transform the classes in the current file
" nmap <Leader>tt :call phpactor#Transform()<CR>
" " Generate a new class (replacing the current file)
" nmap <Leader>cc :call phpactor#ClassNew()<CR>
" " Extract expression (normal mode)
" nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" " Extract expression from selection
" vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" " Extract method from selection
" vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>


" --------------------------- PHP -------------------
imap <C-N> <Plug>(copilot-next)
imap <C-M> <Plug>(copilot-previous)
imap <C-\> <Plug>(copilot-dismiss)


" ------------------------- coc -------------------------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" html, css, js, vue
let g:syntastic_javascript_checkers = ['eslint']

" vue
" let g:tcomment#filetype#guess_vue = 'pug'
" let g:user_emmet_settings = { 'vue': { 'extends': 'css' } }
"--------------------------- ultisnips -------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" let g:UltiSnipsJumpForwardTrigger="<C-b>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" " =================
" "  base16 theme
" " =================
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace = 256
"   let g:airline_theme = 'base16'
"   source ~/.vimrc_background
" endif
" " ctags
" " nmap <Leader>c :!ctags --recurse --php-kinds=citf &<CR>
" " tmp fix bug
" let g:vim_markdown_fenced_languages = ['php=javascript']
"
"
" let g:pymode_python = 'python3'
"
