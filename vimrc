syntax on
set number
set relativenumber
set ignorecase
set laststatus=2
set noerrorbells visualbell t_vb=
colorscheme desert

" Recursive search
set path +=**

" Display all matching files when we tab complete
set wildmenu

" Tabulate settings
set tabstop=4 		" Display width of a tab as =X spaces
set shiftwidth=4	" use =X space indent for autoindentation
set softtabstop=4	" Makes backspace adn tab behave consistently
set noexpandtab		" Keeps tabs as actual tabs

" Enter the current millenium
set nocompatible

" Tweaks for browsing
let g:netrw_banner=0		" Disable annoying banner
let g:netrw_liststyle=3		" Tree view

" Easy switch between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" Define the shell in Vim
set shell=/bin/bash\ -l

" Add block cursor in normal mode (windows terminal git bash)
if &term =~ 'xterm'
    let &t_SI = "\e[5 q"  " Cursor to beam (insert mode)
    let &t_EI = "\e[1 q"  " Cursor to block (normal mode)
endif

" Fly between buffers
nnoremap <leader>l :ls<CR>:b<space>

" Compile LaTeX
nnoremap <leader>cl :!pdflatex<space>
nnoremap <leader>pd :!pdflatex main<CR>
