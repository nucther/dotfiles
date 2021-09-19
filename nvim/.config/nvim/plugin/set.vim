set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set number
set nobackup
set noswapfile
set encoding=utf8
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@


if has('termguicolors')
    set termguicolors
endif
let g:sonokai_style = 'default'
let g:airline_theme = 'sonokai'
let g:sonokai_transparent_background = 1
colorscheme sonokai
