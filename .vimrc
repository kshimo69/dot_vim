" vim:set foldmethod=marker foldlevel=0:
" .vimrc

" plugin neovundle {{{
set nocompatible
filetype off

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
" status lineをいい感じにするやつ
NeoBundle 'https://github.com/Lokaltog/vim-powerline'
" git wrapper
NeoBundle 'https://github.com/tpope/vim-fugitive'
" コメントをトグルするやつ
NeoBundle 'https://github.com/scrooloose/nerdcommenter'

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

" plugin powerline {{{
" splitしてない時にstatus lineが出ない対策
set laststatus=2
" 矢印とかだそうとしてみる
"let g:Powerline_symbols = 'unicode'
" TODO: gitのbranchとか表示したい
function! Powerline#Functions#fugitive#GetBranch(symbol)
  let ret = fugitive#statusline()
  let ret = substitute(ret, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', a:symbol .' \1', 'g')
  return ret
endfunction
" }}} plugin powerline

" plugin nerdcommenter {{{
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" }}} plugin nerdcommenter

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

colorscheme koehler

" }}} View
