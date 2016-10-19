"" Vimの設定
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
set wildmenu
set wildmode=full
set cursorline
set showmatch
set matchtime=1

let $DOTVIM = $HOME . '/.vim'

source $VIMRUNTIME/macros/matchit.vim

""キーバインドの設定
""<Space>.で.vimrcを開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
""<Space>sでファイルを保存
nnoremap <silent><Space>s   :<C-u>update<CR>
""<Space>kでバッファの削除
nnoremap <silent><Space>k   :bd<CR>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
nnoremap j gj
nnoremap k gk
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap x "_x
vnoremap x "_x
""vv で行末まで選択
vnoremap v ^$h
""選択範囲のインデントを連続して変更
vnoremap < <gv
vnoremap > >gv

filetype off

filetype indent on
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set t_Co=256

"" # vim-plug #
"" Install command 
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

"" Plugin list
Plug 'vim-scripts/sudo.vim'
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'vim-scripts/VimClojure'
Plug 'Shougo/vimshell'
Plug 'Shougo/neocomplete'
Plug 'tyru/restart.vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
" for JavaScript
Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'digitaltoad/vim-jade'
" for Gist
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'jreybert/vimagit'

call plug#end()

"" # Indivisual Plugins Setting #
let g:vimfiler_as_default_explorer = 1

"" neocomplete
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

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

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

" restart.vim setting
let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

" Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" vim-markdown setting
let g:vim_markdown_folding_disabled = 1

" angularjs
let g:used_javascript_libs = 'angularjs'

" for perl
autocmd BufNewFile,BufRead *.pm set filetype=perl
autocmd BufNewFile,BufRead *.inc set filetype=perl

" Gist
let g:gist_post_private = 1

" 辞書検索 in Mac
if system("uname")=="Darwin\n"
    " Mac の辞書.appで開く {{{
    " 引数に渡したワードを検索
    command! -nargs=1 MacDict      call system('open '.shellescape('dict://'.<q-args>))
    " カーソル下のワードを検索
    command! -nargs=0 MacDictCWord call system('open '.shellescape('dict://'.shellescape(expand('<cword>'))))
    " 辞書.app を閉じる
    command! -nargs=0 MacDictClose call system("osascript -e 'tell application \"Dictionary\" to quit'")
    " 辞書にフォーカスを当てる
    command! -nargs=0 MacDictFocus call system("osascript -e 'tell application \"Dictionary\" to activate'")
endif
