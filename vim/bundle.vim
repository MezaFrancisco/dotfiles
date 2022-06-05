"==================================================vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-bundler'
Plugin 'gitignore'
Plugin 'fatih/vim-go'
Plugin 'jamessan/vim-gnupg'
Plugin 'hashivim/vim-terraform'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'mogelbrod/vim-jsonpath'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/tagbar'

call vundle#end()
filetype plugin indent on
