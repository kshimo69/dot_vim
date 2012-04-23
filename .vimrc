" vim:set foldmethod=marker foldlevel=0:
" .vimrc

" plugin neobundle {{{
set nocompatible
filetype off

" httpsで取ってくるように指定する
let g:neobundle_default_git_protocol = 'https'

if has('vim_starting')
  if has("win32") || has("win64")
    set runtimepath+=~/vimfiles/neobundle/
    call neobundle#rc(expand('~/vimfiles/bundle/'))
  else
    set runtimepath+=~/.vim/neobundle/
    call neobundle#rc(expand('~/.vim/bundle/'))
  endif
endif

" --------------------------------
" Initialize neobundle
" --------------------------------
" cd ~/.vim/  or  cd GIT_TOP_DIR
" git submodule init
" git submodule update

" --------------------------------
" repository samples
" --------------------------------
" original repos on github
"NeoBundle 'tpope/vim-fugitive'
" https on github
"NeoBundle 'https://github.com/USER/REPONAME'
" vim-scripts repos
"NeoBundle 'rails.vim'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'

" --------------------------------
" Install
" --------------------------------
" :NeoBundleInstall
"
" --------------------------------
" Update
" --------------------------------
" :NeoBundleInstall!

" --------------------------------
" repositories
" --------------------------------
" git wrapper
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'Shougo/vim-vcs'
" Auto Complete
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-clang'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-build'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'kshimo69/unite-vim_hacks'
NeoBundle 'Shougo/vimfiler'
" vimproc
NeoBundle 'Shougo/vimproc'
" vimshell
NeoBundle 'Shougo/vimshell'
" quickrun
NeoBundle 'thinca/vim-quickrun'
" Comment
NeoBundle 'scrooloose/nerdcommenter'
" Status Line
NeoBundle 'Lokaltog/vim-powerline'
" Utils
NeoBundle 'YankRing.vim'
NeoBundle 'Align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'fuenor/qfixgrep.git'
" Web
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'confluencewiki.vim'
" ColorScheme
NeoBundle 'desert256.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'xoria256.vim'
" Doc
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'thinca/vim-ref'
NeoBundle 'glidenote/memolist.vim'
" Project, Explorer
NeoBundle 'project.tar.gz'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vtreeexplorer'
" Tags
NeoBundle 'taglist.vim'  " require: http://ctags.sourceforge.net/
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'gtags.vim'
" Python
NeoBundle 'python_match.vim'
" Rails
NeoBundle 'tpope/vim-rails'
" SQL
NeoBundle 'SQLUtilities'
" Javascript
NeoBundle 'JavaScript-syntax'
" JQuery
NeoBundle 'jQuery'
" Markdown
NeoBundle 'tpope/vim-markdown'

NeoBundle 'Shougo/neobundle.vim'

filetype plugin indent on
" }}} plugin neobundle

" ==== General ==== {{{

" Basic {{{
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"let $PATH = '/opt/local/bin:/opt/local/sbin:' . $PATH
" use modeline
set modeline
" no auto return when column has so long
set textwidth=0
" not create backup files
set nobackup
"" not create swap files
"set noswapfile
"" it can change buffer when buffer don't save
"set hidden
" auto read when file was overwrited
set autoread
" remove any character <BS> key
set backspace=indent,eol,start
" no beep
set vb
set t_vb=
" show command
set showcmd
" expand command
set wildmenu
" start expand with <TAB>
set wildchar=<tab>
" display type: list
set wildmode=list:full
" command history
set history=1000
"" fold with indent
"set foldmethod=indent
"" all level folding
"set foldlevel=0
"" all level not folding when open buffer
"set foldlevel=99
"" show folding line
"set foldcolumn=4

" tab set 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4
" TAB expand SPACE
set expandtab
set smarttab
" highlight bracket
set showmatch
" rect select
" http://vim-users.jp/2010/02/hack125/
set virtualedit&
set virtualedit+=block
"set background=dark
"set autoindent
"set smartindent
"set cindent
set nrformats&
set nrformats-=octal
set ffs=unix,dos,mac  " return code
"if !(has("win32") || has("win95") || has("win64") || has("win16"))
  set encoding=utf-8  " default encoding
"endif
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
nmap ,ee :e ++enc=euc-jp<CR>
nmap ,es :e ++enc=cp932<CR>
nmap ,ej :e ++enc=iso-2022-jp<CR>
nmap ,eu :e ++enc=utf-8<CR>

" Reset Japanese input
au BufNewFile,BufRead * set iminsert=0
" モード変更時にIMEをoffにする設定
" set imdisable
"" Tab reset
"au BufNewFile,BufRead * set tabstop=4 shiftwidth=4 softtabstop=4
" Show zenkaku space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" clipboard
set clipboard+=unnamed,autoselect

" 存在しないフォルダを自動で作る
" http://hashnote.net/2011/12/7/12/
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
      \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
" }}} Basic

" View {{{

" GUI {{{
if has('gui_running')
  " sidebar
  set guioptions& " initialize
  set guioptions+=b
  " clip board
  " http://vim-users.jp/2010/02/hack126/
  set clipboard=unnamed,autoselect
  set guioptions+=a
  "set guifont=M+2VM+IPAG\ circle\ 14
  "set guifont=VL\ Gothic\ 14
  " window size
  "set lines=30
  "set columns=120
  gui
  "set transparency=20
endif
if has('gui_macvim')
  set guioptions& " initialize
  set guioptions-=T
  set guioptions+=a
  set imdisable
  set antialias
  colorscheme macvim
  "set guifont=M+2VM+IPAG\ circle\ Regular:h14
  "set guifont=Monaco:h14
  set guifont=Ricty\ Regular:h16
  set transparency=20
  "set lines=40
  "set columns=120
  set fuoptions=maxvert,maxhorz
  " http://code.google.com/p/macvim-kaoriya/wiki/Readme
  " Lionのフルスクリーンじゃなくて従来のフルスクリーンを使う
  " % defaults write org.vim.MacVim MMNativeFullScreen 0
  set fullscreen
  "au GUIEnter * set fullscreen
endif
" GUI end }}}

" Statusline {{{
" set laststatus=2
" set statusline=%n\:%y%F\ %(\[%{GitBranch()}\]\ %)\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}ascii\:\%03.3b\|hex\:\%02.2B\|%m%r%=<%v\:%l/%L:%p%%>
" highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
"highlight StatusLine gui=BOLD guifg=Black guibg=LightYellow
" Change status line's color when into insert mode
" augroup InsertHook
  " autocmd!
  " autocmd InsertEnter * highlight StatusLine guifg=White guibg=DarkCyan
  " autocmd InsertLeave * highlight StatusLine guifg=Black guibg=LightYellow
" augroup END
" }}} Statusline

" display line number
set number
set diffopt+=vertical
" character when use 'set list'
set listchars=eol:$,tab:>-,trail:_
" display TAB and CR
"set list
" display full length space
scriptencoding utf-8
augroup highlightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=Red guibg=Red
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme xoria256
syntax on
" highlight Folded ctermbg=grey ctermfg=blue guibg=grey guifg=blue
" highlight FoldColumn ctermfg=green guifg=green
set title
set ruler
set cursorline
" display line on current buffer
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
"hi clear CursorLine
"hi CursorLine gui=underline
"highlight CursorLine ctermbg=blue guibg=grey20
" Change cursor color when IME on/off
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=LightRed guifg=NONE
endif

" }}} View

" Search {{{
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
" cancel highlight search
nmap <ESC><ESC> :nohlsearch<CR><ESC>
" search help under cursor keyword
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><Enter>

" grep
"set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
"set grepprg=grep\ -nh
" }}} Search

" Keymap {{{
nnoremap j gj
nnoremap k gk
" nnoremap <Space> jzz
" nnoremap <S-Space> kzz
nnoremap Y y$
nnoremap ¥ \
inoremap ¥ \
" }}} Keymap

" Tab {{{
nnoremap <silent> tt :<c-u>Texplore<cr>
nnoremap <silent> tf :<c-u>tabfirst<cr>
nnoremap <silent> tl :<c-u>tablast<cr>
nnoremap <silent> tn :<c-u>tabnext<cr>
nnoremap <silent> tN :<c-u>tabNext<cr>
nnoremap <silent> tp :<c-u>tabprevious<cr>
nnoremap <silent> te :<c-u>tabedit<cr>
nnoremap <silent> tc :<c-u>tabclose<cr>
nnoremap <silent> to :<c-u>tabonly<cr>
nnoremap <silent> ts :<c-u>tabs<cr>
" http://doruby.kbmj.com/aisi/20091218/Vim__
" 個別のタブの表示設定をします
function! GuiTabLabel()
  " タブで表示する文字列の初期化をします
  let l:label = ''
  " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
  let l:bufnrlist = tabpagebuflist(v:lnum)
  " 表示文字列にバッファ名を追加します
  " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
  let l:label .= l:bufname == '' ? 'No title' : l:bufname
  " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif
  " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  " 表示文字列を返します
  return l:label
endfunction

" guitablabel に上の関数を設定します
" その表示の前に %N というところでタブ番号を表示させています
set guitablabel=%N:\ %{GuiTabLabel()}
" }}} Tab

" Buffer {{{
" nmap <silent> <C-x><C-n> :bnext<CR>
" nmap <silent> <C-x><C-p> :bprevious<CR>
" nmap <silent> <C-x><C-l> :buffers<CR>
" show serach result middle of buffer
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz
" split
nmap spj <SID>(split-to-j)
nmap spk <SID>(split-to-k)
nmap sph <SID>(split-to-h)
nmap spl <SID>(split-to-l)
nnoremap <SID>(split-to-j) : <C-u>belowright split<CR>
nnoremap <SID>(split-to-k) : <C-u>aboveleft split<CR>
nnoremap <SID>(split-to-h) : <C-u>topleft vsplit<CR>
nnoremap <SID>(split-to-l) : <C-u>botright vsplit<CR>
" scroll top window with key Ctrl+Shift+J
nnoremap <C-S-J> <C-W>k<C-E><C-W><C-W>
" }}} Buffer

" Remember cursor potition {{{
" autocmd BufReadPost *
  " \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  " \     exe "normal! g'\"" |
  " \ let b:posBufReadPost = getpos('.') |
  " \ endif
" autocmd BufWinEnter *
  " \ if exists('b:posBufReadPost') |
  " \     if b:posBufReadPost == getpos('.') |
  " \     execute 'normal! zvzz' |
  " \     endif |
  " \ unlet b:posBufReadPost |
  " \ endif
" }}} Remember cursor potition

" Cscope {{{
if has("cscope") && filereadable("/usr/local/bin/cscope")
  set csprg=/usr/loca/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif
" }}} Cscope

" }}} ==== General ====

" ==== Programming ==== {{{

" Templete {{{
augroup templeteload
  autocmd!
  autocmd BufNewFile *.c 0r ~/.vim/autoinsert/c.c
  autocmd BufNewFile *.pl 0r ~/.vim/autoinsert/perl.pl
  autocmd BufNewFile *.py 0r ~/.vim/autoinsert/python.py
  autocmd BufNewFile *.rb 0r ~/.vim/autoinsert/ruby.rb
  autocmd BufNewFile *.rst 0r ~/.vim/autoinsert/rst.rst
augroup END
" }}} Templete

" ChangeLog {{{
let g:changelog_username = "Kimihiko Shimomura  <kshimo69@gmail.com>"
let g:changelog_dateformat = "%Y-%m-%d (%a)"
"nmap <C-m> :e ~/Dropbox/ChangeLog.txt<CR>
" }}} ChangeLog

" Sukicolle {{{
augroup sukicolleroot
  autocmd!
  autocmd BufEnter ~/Dropbox/project/sukicolle/wire/**/* lcd ~/Dropbox/project/sukicolle/wire
augroup END
" }}} Sukicolle

" }}} ==== Programming ====

" ==== Functions ==== {{{

" Allargs {{{
" http://d.hatena.ne.jp/secondlife/20060203/1138978661
" ex)
" :Allargs %s/foo/bar/ge|update
" 使う時。foo を bar に置換しまくる。
" :Allargs %s/foo/bar/ge|update
" eオプションをつけないと foo が無いというメッセージがのんびり表示されて、いつま
" でたっても置換が終わらないので気をつけよう(それに気づかずに密かにハマった)
" コマンドは | で連続で実行できて、update は変更のあったバッファだけを保存。と。
" カレントの *.cpp を置換する場合は予め、
" :ar *.cpp
" ってやっとくと全部読み込まれる。
" 確認するには
" :ar
function! Allargs(command)
  let i = 0
  while i < argc()
    if filereadable(argv(i))
      execute "e " . argv(i)
      execute a:command
    endif
    let i = i + 1
  endwhile
endfunction
command! -nargs=+ -complete=command Allargs call Allargs(<q-args>)
" }}} Allargs

" AllMaps {{{
" http://vim-users.jp/2011/02/hack203/
" 全てのマッピングを表示
" :AllMaps
" 現在のバッファで定義されたマッピングのみ表示
" :AllMaps <buffer>
" どのスクリプトで定義されたかの情報も含め表示
" :verbose AllMaps <buffer>
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>
" }}} AllMaps

" Open junk file {{{
" http://vim-users.jp/2010/11/hack181/
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  "let l:junk_dir = $HOME . '/junk'. strftime('/%Y/%m')
  let l:junk_dir = $HOME . '/junk'
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y%m%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction
" }}} Open junk file

" }}} ==== Functions ====

" ==== Plugins ==== {{{

" plugin powerline {{{
let g:Powerline_symbols = 'compatible'
" splitしてない時にstatus lineが出ない対策
set laststatus=2
" Overriding symbols
let g:Powerline_symbols_override = {
  \ 'LINE': 'L',
  \ }
" Overriding dividers
" 1: Hard right-pointing arrow
" 2: Soft right-pointing arrow
" 3: Hard left-pointing arrow
" 4: Soft left-pointing arrow
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_dividers_override = ['', '', '', '']
" ファイル名を短く表示する
let g:Powerline_stl_path_style = "short"
" Insert the charcode segment after the filetype segment
"call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')
" }}} plugin powerline

" plugin nerdcommenter {{{
let NERDSpaceDelims = 1
let NERDDefaultNesting = 0
" ,,でコメントをトグルする
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" }}} plugin nerdcommenter

" plugin vim-fugitive {{{
"nnoremap <Space>gd :<C-u>Gdiff<Enter>
"nnoremap <Space>gs :<C-u>Gstatus<Enter>
"nnoremap <Space>gl :<C-u>Glog<Enter>
"nnoremap <Space>ga :<C-u>Gwrite<Enter>
"nnoremap <Space>gc :<C-u>Gcommit<Enter>
"nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
"nnoremap <Space>gb :<C-u>Gblame<Enter>
" }}} plugin vim-fugitive

" plugin neocomplcache {{{
" Setting examples:

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 補完に辞書ファイルを追加
set complete+=k

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}} plugin neocomplcache

" plugin vimshell {{{
command! VS :VimShell
" }}} plugin vimshel

" plugin matchit {{{
source $VIMRUNTIME/macros/matchit.vim
"let b:match_words = &matchpairs . '\<if\>:\<else\>,\<if\>:\<elif\>,\<begin\>:\<end\>'
" }}} plugin matchit

" plugin unite {{{
" http://d.hatena.ne.jp/ruedap/20110110/vim_unite_plugin
" http://d.hatena.ne.jp/Voluntas/20110823/1314031095
" 入力モードで開始する
let g:unite_enable_start_insert=1
" uniteのウインドウの高さ
let g:unite_winheight=15
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -direction=botright -auto-resize -toggle<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register -direction=botright -auto-resize -toggle<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru -direction=botright -auto-resize -toggle<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru file file/new -direction=botright -auto-resize -toggle<CR>
nnoremap <silent> ;; :<C-u>Unite buffer file_mru file file/new -direction=botright -auto-preview -toggle<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file/new -direction=botright -auto-resize -toggle<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" http://ujihisa.blogspot.com/2010/12/investing-methods-of-object-on-unite.html
" Unite evalruby
let s:unite_source = {
  \ 'name': 'evalruby',
  \ 'is_volatile': 1,
  \ 'required_pattern_length': 1,
  \ 'max_candidates': 30,
  \ }
function! s:unite_source.gather_candidates(args, context)
  if a:context.input[-1:] == '.'
    let methods = split(
      \ unite#util#system(printf('ruby -e "puts %s.methods"', a:context.input[:-2])),
      \ "\n")
    call map(methods, printf("'%s' . v:val", a:context.input))
  else
    let methods = [a:context.input]
  endif
  return map(methods, '{
    \ "word": v:val,
    \ "source": "evalruby",
    \ "kind": "command",
    \ "action__command": printf("!ruby -e \"p %s\"", v:val),
    \ }')
endfunction
call unite#define_source(s:unite_source)

" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
" }}} plugin unite

" plugin open-browser {{{
" http://vim-users.jp/2011/08/hack225/
let g:netrw_nogx = 1 " disable netrw's gx mapping.
" カーソル下のURLをブラウザで開く
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" カーソル下のキーワードをググる
nnoremap go :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
vnoremap go :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
" }}} plugin open-browser

" plugin echodoc {{{
" 自動的に有効
let g:echodoc_enable_at_startup = 1
" }}} plugin echodoc

" plugin quickrun {{{
let g:quickrun_config = {}

" RSpec
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}
"let g:quickrun_config['ruby.rspec'] = {'command': "spec -l {line('.')}"}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" rst2html
let g:quickrun_config['rst'] = {
  \ 'command': 'rst2html.py',
  \ 'outputter': 'browser',
  \ }
" }}} plugin quickrun

" plugin project {{{
:let g:proj_flags = "imstc"
":nmap <silent> <Leader>p <Plug>ToggleProject
":nmap <silent> <Leader>P :Project<CR>
if getcwd() != $HOME
    if filereadable(getcwd(). '/.vimprojects')
        Project .vimprojects
    endif
endif
autocmd BufAdd .vimprojects silent! %foldopen!
" }}} plugin project

" plugin Align {{{
let g:Align_xstrlen = 3
let g:DrChipTopLvlMenu = 'Align'
" }}} plugin Align

" plugin yankring {{{
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" }}} plugin yankring

" plugin smartchr {{{
inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
inoremap <expr> , smartchr#one_of(', ', ',')
" cnoremap <expr> / smartchr#loop('/', '~/', '//', {'ctype': ':'}
autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
" }}} plugin smartchr

" plugin memolist {{{
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix  =  "rst"
let g:memolist_memo_date  =  "%Y-%m-%d %H:%M"
let g:memolist_memo_date  =  "epoch"
let g:memolist_memo_date  =  "%D %T"
let g:memolist_prompt_tags  =  1
let g:memolist_prompt_categories  =  1
let g:memolist_qfixgrep  =  1
let g:memolist_vimfiler  =  1
" let g:memolist_template_dir_path  =  "path/to/dir"
" }}} plugin memolist

" plugin vtreeexplorer {{{
map <F10> :VSTreeExplore <CR>
let g:treeExplVertical = 1
" }}} plugin vtreeexplorer

" plugin Source Explorer {{{
" 自動でプレビューを表示する。
let g:SrcExpl_RefreshTime = 1
" プレビューウインドウの高さ
" let g:SrcExpl_WinHeight = 9
" tagsは自動で作成する
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey = "<C-b>"
map <F8> :SrcExplToggle <CR>
" }}} Source Explorer

" plugin confluencewiki {{{
augroup confluencewikifile
  autocmd!
  autocmd BufWinEnter,BufNewFile *.wiki set filetype=confluencewiki
augroup END
" }}} plugin confluencewiki

" }}} ==== Plugins ====
