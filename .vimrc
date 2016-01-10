""Vimの設定
set backupdir=$HOME/.vimbackup
set clipboard=unnamed
set nocompatible
set expandtab
set hidden
set incsearch
set number
set smarttab
set smartindent
set shiftwidth=4
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set tabstop=4
set expandtab
set shiftwidth=4
set noswapfile
set wildmenu
set wildmode=full
set cursorline
set showmatch
set matchtime=1

let $DOTVIM = $HOME . '/.vim'

source $VIMRUNTIME/macros/matchit.vim

"let g:filetype_m = 'objc'

""キーバインドの設定
"imap {} {}<left>
"imap [] []<left>
"imap () ()<left>
"<Space>.で.vimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
"<Space>sでファイルを保存
nnoremap <silent><Space>s   :<C-u>update<CR>
"<Space>kでバッファの削除
nnoremap <silent><Space>k   :bd<CR>
"nnoremap <silent><Space>t   :TweetVimSay<CR>
"挿入モードのキーバインドをEmacs風に設定
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"inoremap <C-b> <Left>
"inoremap <C-f> <Right>
"inoremap <C-n> <Down>
"inoremap <C-p> <Up>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
"inoremap <C-k> <C-o>D
nnoremap j gj
nnoremap k gk
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap x "_x
vnoremap x "_x
"vv で行末まで選択
vnoremap v ^$h
"選択範囲のインデントを連続して変更
vnoremap < <gv
vnoremap > >gv

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

""NeoBundleの設定
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'vim-scripts/VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'tokorom/clang_complete.git'
NeoBundle 'tokorom/clang_complete-getopts-ios.git'
NeoBundle 'tyru/restart.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" for JavaScript
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'digitaltoad/vim-jade'
" for Gist
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'jreybert/vimagit'

filetype plugin indent on
NeoBundleCheck

filetype indent on
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set t_Co=256

""php - syntax check
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

""unite.vimの設定
"キーマップの設定 
"nnoremap    [unite]   <Nop>
"nmap    <Space>f [unite]
"nnoremap [unite]u  :<C-u>Unite -no-split<Space>
"nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"nnoremap <silent> [unite]k :<C-u>Unite<Space>bookmark<CR>
"nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir file<CR>
"nnoremap <silent> [unite]a :<c-u>UniteBookmarkAdd<CR>
"nnoremap <silent> ,vr :UniteResume<CR>
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"        nmap <buffer> <Esc> <Plug>(unite_exit)
"endfunction"}}}
"" vinarise
"let g:vinarise_enable_auto_detect = 1
"" unite-build map
"nnoremap <silent> ,vb :Unite build<CR>
"nnoremap <silent> ,vcb :Unite build:!<CR>
"nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
" }}}

"" vimfiler setting
nmap     <silent> <Space>ff :VimFilerBufferDir -split -simple -winwidth=30 -no-quit<CR>
nmap     <silent> <Space>fu :Unite -no-split<CR>
nnoremap <silent> <Space>fa :UniteBookmarkAdd<CR>
nnoremap <silent> <Space>fb :Unite bookmark<CR>
nnoremap <silent> <Space>fr :Unite buffer<CR>
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

let g:vimfiler_as_default_explorer = 1

""neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'objc' : $DOTVIM.'/dict/objc.dict',
    \ 'ruby' : $DOTVIM.'/dict/ruby.dict',
    \ 'php' : $DOTVIM.'/dict/php.dict',
    \ 'perl' : $DOTVIM.'/dict/perl.dict'
        \ }
"wget https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict

"" Define sources.
"if !exists('g:neocomplete#sources')
"		  let g:neocomplete#sources = {}
"endif
"let g:neocomplete#sources.ruby = ['file', 'tag', 'neosnippet', 'vim', 'dictionary', 'omni', 'member', 'syntax', 'include', 'buffer']
"       let g:neocomplete#sources.cpp = ['buffer', 'include']

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*qq::'kjq

" restart.vim setting
let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

" emmet-vim setting
let g:user_emmet_settings = {
            \ 'lang' : 'ja'
            \ }
" powerline setting
"let g:Powerline_symbols = 'fancy'
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"set noshowmode

" vimshell setting
"let g:vimshell_user_prompt=':~'
"let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
nnoremap <silent><Space>h :VimShell<CR>

" Markdownの設定
autocmd BufRead,BufNewFile *.md set filetype=markdown

" angularjs
let g:used_javascript_libs = 'angularjs'

" for perl
autocmd BufNewFile,BufRead *.pm set filetype=perl
autocmd BufNewFile,BufRead *.inc set filetype=perl
