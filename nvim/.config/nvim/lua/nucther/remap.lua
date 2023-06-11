vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- File Saves 
vim.keymap.set("n","<leader>w", ":w<CR>", {noremap=true})
vim.keymap.set("n","<leader>ws", ":w !sudo tee %", {noremap=true})
vim.keymap.set("n","<leader>wa", ":q!<CR>", {noremap=true})
vim.keymap.set("n","<leader>wq", ':wq<CR>', {noremap=true})
vim.keymap.set("n","<leader>qq", ':q<CR>', {noremap=true})
vim.keymap.set("n","<leader>S",":w !sudo tee %", {noremap=true})

-- Visual Moves 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n","<C-n>",":bn<CR>")
vim.keymap.set("n","<C-b>",":bp<CR>")
vim.keymap.set("n","<leader>d",":bd<CR>")
