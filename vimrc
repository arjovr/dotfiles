set nocompatible
filetype off " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'faith/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'altercation/vim-colors-solarized'
Plugin '1995eaton/vim-better-javascript-completion'
call vundle#end()
filetype plugin indent on

colorscheme solarized
set background=dark
syntax on

let mapleader = ","

let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <leader>b <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tt <Plug>(go-test-compile)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

let g:go_list_type = "quickfix"

augroup go
    autocmd!
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

set relativenumber
set number
set autowrite

au BufReadPost *.qtpl set ft=html

nmap gc :e ~/.vimrc<cr>
nmap gb :b#<cr>

set hidden
set undofile
set undodir=~/.vim/undo

augroup html
	autocmd!
	au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup java
	autocmd!
	au FileType java setlocal omnifunc=javacomplete#Complete
	au FileType java set makeprg=javac\ %
	au FileType java nmap <leader>c :make<cr>
	au FileType java nmap <leader>r :!java %:r<cr>
augroup END

