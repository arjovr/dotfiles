" BASIC SETUP
set nocompatible
set autoread

" PLUGINS
" First you must:
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('robertmeta/nofrils')
call minpac#add('tpope/vim-fugitive')
call minpac#add('fatih/vim-go')
call minpac#add('SirVer/ultisnips')

" Colors
syntax on
filetype plugin on
colo nofrils-dark

" FINDING FILES
set cdpath +=~/src,**
set cdpath +=~/src,~/projects
set path +=**
set wildmenu

" FILE BROWSING
let g:netrw_banner=0
let g:netrw_liststyle=3

" SEARCH
set ignorecase
set smartcase

" BUFFERS
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" GO
augroup go
	au FileType go  set tags+=~/pkg/tags,~/pkg/mod/tags
augroup END

" SUDO WRITE
" Allow saving of files as sudo when I forgot to start vim using sudo.
command! W w !sudo tee > /dev/null %

" Open Config file
nnoremap gc :e ~/.vim/vimrc<CR>

" FORMAT
set shiftwidth=4
set tabstop=4
set softtabstop=4

set formatoptions+=n
set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
set formatlistpat+=\\(                      " |  Start group
set formatlistpat+=[0-9]\\+                 " |  |  Numbers
set formatlistpat+=\\\|                     " |  |  or
set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
set formatlistpat+=\\)                      " |  End group
set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
