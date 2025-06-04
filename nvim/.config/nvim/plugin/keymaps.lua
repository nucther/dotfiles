local set = vim.keymap.set
local cmd = vim.cmd


-- Set default tab config
cmd('set rnu')
cmd('set ts=8 sts=4 sw=4 noet')
cmd('set smartindent')

-- Edit
set("n","<C-n>","<cmd>bn<CR>", { desc="Next tab"})
set("n","<C-b>","<cmd>bp<CR>", { desc="Previous tab"})
set("n","<leader>d","<cmd>bd<CR>", {desc="Close tab"})
set("n","<leader>w","<cmd>w<CR>",{desc="Save current file"})

