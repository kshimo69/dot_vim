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
"NeoBundle 'Shougo/vimfiler'
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
"NeoBundle 'YankRing.vim'
NeoBundle 'Align'
"NeoBundle 'tpope/vim-surround'
"NeoBundle 'kana/vim-smartchr'
" Web
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'tyru/open-browser.vim'
" ColorScheme
NeoBundle 'desert256.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'xoria256.vim'
" Doc
NeoBundle 'Shougo/echodoc.git'
"NeoBundle 'thinca/vim-ref'
" Project, Explorer
NeoBundle 'project.tar.gz'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'vtreeexplorer'
" Tags
"NeoBundle 'taglist.vim'  " require: http://ctags.sourceforge.net/
"NeoBundle 'Source-Explorer-srcexpl.vim'  " 使うかな？
" Python
NeoBundle 'python_match.vim'
" Rails
"NeoBundle 'tpope/vim-rails'
" SQL
"NeoBundle 'SQLUtilities'
" Javascript
"NeoBundle 'JavaScript-syntax'
" JQuery
"NeoBundle 'jQuery'
" Markdown
"NeoBundle 'tpope/vim-markdown'

NeoBundle 'Shougo/neobundle.vim'

filetype plugin indent on
" }}} plugin neobundle

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

syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 softtabstop=4
set smarttab
set expandtab
set ffs=unix,dos,mac  " return code
set encoding=utf-8  " default encoding
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
nmap ,ee :e ++enc=euc-jp<CR>
nmap ,es :e ++enc=cp932<CR>
nmap ,ej :e ++enc=iso-2022-jp<CR>
nmap ,eu :e ++enc=utf-8<CR>

" モード変更時にIMEをoffにする設定
set imdisable

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

colorscheme xoria256

" }}} View

" ==== Programming ==== {{{

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

" plugin matchit {{{
source $VIMRUNTIME/macros/matchit.vim
"let b:match_words = &matchpairs . '\<if\>:\<else\>,\<if\>:\<elif\>,\<begin\>:\<end\>'
" }}} plugin matchit

" plugin unite {{{
" http://d.hatena.ne.jp/ruedap/20110110/vim_unite_plugin
" http://d.hatena.ne.jp/Voluntas/20110823/1314031095
" 入力モードで開始する
let g:unite_enable_start_insert=1
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
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
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

" }}} ==== Plugins ====
