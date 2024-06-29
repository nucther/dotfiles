local set = vim.keymap.set
local cmd = vim.cmd

-- Default
set("n","<leader>p","<cmd>Oil<CR>", { desc = "Open Oil file manager" })
set("n","<leader><leader>x","<cmd>source %<CR>", { desc = "exec current file" })

-- Editor
set("n","<leader>w","<cmd>w<CR>", { desc = "write files" })
set("n","<C-n>","<cmd>bn<CR>")
set("n","<C-b>","<cmd>bp<CR>")
set("n","<leader>d","<cmd>bd<CR>")

-- Set config 
cmd('set rnu')
cmd('set ts=4')
cmd('set sw=4')
cmd('set softtabstop=4')
cmd('set smartindent')
