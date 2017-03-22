set tabstop=4
set shiftwidth=4
set softtabstop=4
" ...unless you're using Ruby.
augroup rubytabs
    autocmd!
    autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Turn syntax highlighting on.
syntax on

" Number lines
set number
" Don't wrap lines until column 110
set textwidth=110
" Lightly highlight column 99
set colorcolumn=99
highlight ColorColumn ctermbg=238 guibg=#444444
" Highlight the line the cursor is on
set cursorline
" Allow backspace/delete affect what it likes. (nvim default)
set backspace=indent,eol,start
" UTF-8 by default.
set encoding=utf-8
" Attempt to coerce unix line endings
set fileformats=unix,dos
set fileformat=unix

" Angle brackets, doublequotes, and singlequotes are matched.
" Reflects the settings from vim-autoclose
set matchpairs +=<:>
set matchpairs +=":"
set matchpairs +=':'
set matchpairs +=`:`

" Enable the mouse in help files only.
set mouse=a
