"==========================
" Nurohman VIM 
"
" last update: 29 Aug 2021
"==========================

" Plugin 
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim', {'as': 'dracula'}
call plug#end()

" FUNCTIONS
function EmptyReg()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfunction

" PLUGIN SETTINGS
if has('termguicolors')
        set termguicolors
endif

let g:sonokai_style = 'atlantis'
let g:airline_theme = 'sonokai'
"let g:airline_theme = 'dracula'
let NERDTreeShowHidden = 1

" GENERAL
colorscheme sonokai
"colorscheme dracula

set relativenumber
set number
set number relativenumber
filetype plugin on 
set nocompatible
syntax enable
set backspace=2
set hid
set ai
set si
set wrap
set nobackup
set nowb
set noswapfile
set tabpagemax=10
set encoding=utf8


" LEADER KEY
let mapleader=" "

" TERMINAL
noremap <leader>tv :vsplit term://zsh<CR>
noremap <leader>th :split term://zsh<CR>
noremap <leader>wq :q<CR>
tnoremap <A-w> <C-\><C-N><C-w><C-w>


" RESIZE SPLIT
noremap <silent> <C-Left> :vert resize -5<CR>
noremap <silent> <C-Right> :vert resize +5<CR>
noremap <silent> <C-Up> :resize +5<CR>
noremap <silent> <C-Down> :resize -5<CR>

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" TAB
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>toa :tab ball<cr>

" Buffer
map <leader>bd :bufdo bd<cr>
map <leader>l :bn<cr>
map <leader>h :bp<cr>

" Telescopic
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Drag copy
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Navigation
map <silent> <leader><cr> :noh<cr>
nnoremap <C-h> <C-W><C-h>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <A-h> <C-W>H
nnoremap <A-l> <C-W>L
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K 

" CUSTOM FUNCTIONS

