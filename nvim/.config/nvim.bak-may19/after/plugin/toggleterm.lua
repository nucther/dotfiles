require("toggleterm").setup{
    open_mapping = [[<c-\>]],
}

-- Git terminal 
local terminal = require('toggleterm.terminal').Terminal 
local opengit = terminal:new({ 
    cmd='lazygit', 
    direction="float",
    hidden = true, 
})

function termgit()
    opengit:toggle()
end


-- set keymap 
--
vim.keymap.set("n","<leader>g",":lua termgit()<CR>")
vim.keymap.set("n","<leader>gf",":ToggleTerm direction=float<CR>")
vim.keymap.set("n","<leader>gh",":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n","<leader>gv",":ToggleTerm direction=vertical size=80<CR>")
vim.keymap.set("t","<C-w>=","<C-\\><C-n>:resize +50<CR>i")
vim.keymap.set("t","<C-w>","<C-\\><C-n>")

