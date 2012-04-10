" vim:set foldmethod=marker foldlevel=0:
" .vimrc

" vundle setting {{{
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

" Initialize vundle
" cd ~/.vim/  or  cd GIT_TOP_DIR
" git submodule init
" git submodule update

" repository samples
"" original repos on github
"Bundle 'tpope/vim-fugitive'
"" vim-scripts repos
"Bundle 'rails.vim'
"" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" Install
" :BundleInstall
" Update
" :BundleInstall!

" repositories
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on
" }}} vundle setting end


syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 softtabstop=4
set smarttab
set expandtab
set ffs=unix,dos,mac  " return code
if !(has("win32") || has("win95") || has("win64") || has("win16"))
   set encoding=utf-8  " default encoding
endif
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
nmap ,ee :e ++enc=euc-jp<CR>
nmap ,es :e ++enc=cp932<CR>
nmap ,ej :e ++enc=iso-2022-jp<CR>
nmap ,eu :e ++enc=utf-8<CR>
