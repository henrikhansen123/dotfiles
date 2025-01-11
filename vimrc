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

function! OpenOrCreateLyxFile()
    " Get the current file name without extension
    let current_file = expand('%:t:r')
    " Specify the directory where the .lyx file should be searched/created
    let lyx_dir = '~/OneDrive - Aarhus universitet/Notes/lyx-files/'
    " Build the full path to the .lyx file
    let lyx_file = lyx_dir . current_file . '.lyx'

    " Check if the .lyx file exists
    if !filereadable(lyx_file)
        " If it doesn't exist, create the .lyx file
        call system('touch ' . shellescape(lyx_file))
        echo "Created new .lyx file: " . lyx_file
    else
        echo "Opening existing .lyx file: " . lyx_file
    endif

    " Open the .lyx file using LyX
    call system('lyx ' . shellescape(lyx_file) . ' &')
endfunction
