syntax on
set number
set relativenumber
set laststatus=2
set noerrorbells visualbell t_vb=
set colorcolumn=80

" Recursive search
set path +=**

" Dsiplay all matching files when we tab complete
set wildmenu

" Indent only 2 spaces with tab
set tabstop=2

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

