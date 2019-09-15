" BASIC SETUP
set nocompatible
set autoread
set clipboard=unnamedplus
set title
set mouse=

" Colors
syntax on
filetype plugin on

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
" requiere ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" BUFFERS
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" GO
autocmd BufRead,BufNewFile *.tpl set filetype=html

" HTML
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab

" SUDO WRITE
" Allow saving of files as sudo when I forgot to start vim using sudo.
command! W w !sudo tee > /dev/null %

" Open Config file
nnoremap gc :e ~/.vim/vimrc<CR>

" FORMAT
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

" Backups
" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

