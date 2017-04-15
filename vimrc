set nocompatible
filetype off " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
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
let g:go_list_type = "quickfix"

augroup go
    autocmd!
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>r <Plug>(go-rename)
    au FileType go nmap <Leader>s <Plug>(go-implements)
    au FileType go nmap <leader>b <Plug>(go-install)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>tt <Plug>(go-test-compile)
    au FileType go nmap <leader>d <Plug>(go-def)

    au FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

set autowrite

au BufReadPost *.qtpl set ft=html
au BufReadPost *.tpl set ft=html

nmap gc :e ~/.vimrc<cr>
nmap gb :b#<cr>
nmap <leader>gs :Gstatus<cr>
nnoremap <leader>,co :copen<cr>
nnoremap <leader>,cn :cnext<cr>
nnoremap <leader>,cp :cprev<cr>

set hidden
set undofile
set undodir=~/.vim/undo
set path+=**

augroup html
	autocmd!
	au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup vim
	autocmd!
	autocmd FileType vim setlocal keywordprg=:help
augroup END

vnoremap // y/<c-r>"<cr>
nnoremap ,w <c-w>
command! W w !sudo tee % > /dev/null

let g:netrw_list_hide= '.*\.swp$'

