call plug#begin('~/.vim/plugged')
" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
call plug#end()


syntax enable

let NerdTreeShowHidden = 1
let mapleader = " "

noremap <silent> <leader>+ :vert resize +5<CR>
noremap <silent> <leader>- :vert resize -5<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


noremap <silent> <leader>td :TodoTelescope<CR>

