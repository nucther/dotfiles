-- Get plugins 
-- using vim plug 

local Plug = vim.fn['plug#']

vim.call('plug#begin','~/.vim/plugged')

-- Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

-- Statusline 
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

-- 
-- Code usage
--
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter'

-- 
-- vnsnip
--
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

--
-- FZF Finder
--
--Plug 'junegunn/fzf'
Plug 'ibhagwan/fzf-lua'

-- Theme
--Plug 'dracula/vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'stevearc/dressing.nvim'

-- Terminal 
Plug 'akinsho/toggleterm.nvim'

vim.call('plug#end')


-- Theme Setup
-- Setup theme to Dracula 
vim.cmd('colorscheme github_dark')


-- Set default vim format
vim.cmd('syntax enable')
vim.cmd('set nobackup')
vim.cmd('set noswapfile')

-- Set options 
--
local set = vim.opt

set.path = '**'
set.wildmode ='longest,list,full'
set.wildmenu = true

set.wildignore = '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

set.termguicolors = true
set.number = true 
set.encoding = 'utf8'
--set.guicursor = true
set.relativenumber = true 
set.hidden = true
set.tabstop = 4 
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true 
--set.nowrap = true
set.undodir = '~/.vim/undodir'
set.undofile = true
set.incsearch = true 
set.scrolloff = 8
--set.signcolumn = yes
--set.isfname ='@-@'
--set.completeopt = '-preview'


-- Keyboard Shortcut 

vim.g.mapleader = ' '
-- Open Native Explorer
vim.api.nvim_set_keymap('n','<leader>e',':Ex<CR>',{noremap= true})

-- Editing
-- Save
vim.api.nvim_set_keymap('n','<C-s>',':w<CR>',{noremap= true})
vim.api.nvim_set_keymap('n','<leader>gs',':lua require"git".gfp()<CR>',{noremap= true})

-- drag and move 
vim.api.nvim_set_keymap('v','J',':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v','K',':m \'<-2<CR>gv=gv', { noremap = true })


--
--FZF lua
vim.api.nvim_set_keymap('n','<C-b>',':lua require\'fzf-lua\'.buffers()<CR>', {noremap = true})

-- Terminal
-- Debuger
vim.api.nvim_set_keymap('n','<C-d>d', ':ToggleTerm<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<C-d>c', ':lua require\'terminal\'.openTermCurrentDir()<CR>', {noremap = true})
