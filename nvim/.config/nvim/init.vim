call plug#begin('~/.vim/plugged')
" LSP Plugins
Plug 'neovim/nvim-lspconfig'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"lspkind
Plug 'onsails/lspkind-nvim'

" NerdTree
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'

"Tmux
Plug 'tmux-plugins/vim-tmux'

" Formater
Plug 'sbdchd/neoformat'

" Todo List 
Plug 'folke/todo-comments.nvim'

" FZF 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" RipGrep


" Comment 
Plug 'terrortylor/nvim-comment'

call plug#end()


syntax enable

let NerdTreeShowHidden = 1
let mapleader = " "

noremap <silent> <leader>+ :vert resize +5<CR>
noremap <silent> <leader>- :vert resize -5<CR>


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


noremap <silent> <leader>td :TodoTelescope<CR>

noremap <silent> <leader>vs :vsplit<CR>
nnoremap <C-h> <C-W><C-h>
nnoremap <C-l> <C-W><C-l>
nnoremap <A-h> <C-W>H
nnoremap <A-l> <C-W>L

"File Manager
"nnoremap <leader>ls :!ls<CR>:e
"nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>e :Ex<CR>

" FZF
nnoremap <C-f> :Files<CR>
nnoremap <C-o> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>

"Save File
nnoremap <C-s> :w<CR>
