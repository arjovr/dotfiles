set nocompatible

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('fatih/vim-go')
call minpac#add('mattn/emmet-vim')
call minpac#add('SirVer/ultisnips')

filetype plugin indent on
syntax on

let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
let g:go_list_type = "quickfix"
let g:go_gocode_unimported_packages = 1

augroup go
    autocmd!
    au FileType go nmap <leader>i <Plug>(go-info)
    au FileType go nmap <leader>r <Plug>(go-rename)
    au FileType go nmap <leader>s <Plug>(go-implements)
    au FileType go nmap <leader>b <Plug>(go-install)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>tt <Plug>(go-test-compile)
    au FileType go nmap <leader>d <Plug>(go-def)
    au FileType go nmap <c-w>] <Plug>(go-def)
    au FileType go nmap ,w] <Plug>(go-def)
    au FileType go set foldmethod=syntax
    au FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

set foldlevelstart=20

au BufReadPost *.qtpl set ft=html
au BufReadPost *.tpl set ft=html

nmap gc :e ~/.vimrc<cr>

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
let g:netrw_banner = 0

set ignorecase
set smartcase

