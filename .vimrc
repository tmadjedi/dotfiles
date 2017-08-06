set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" line number, command, and mode
set number
set showcmd
set showmode

" tabs/spaces and indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" vundle plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

syntax enable 
filetype plugin indent on

" use solarized colors
set background=dark
colorscheme solarized
