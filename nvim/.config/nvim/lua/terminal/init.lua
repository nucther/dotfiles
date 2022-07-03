-- ToogleTerm 
--

local M = {}

local Terminal  = require('toggleterm.terminal').Terminal

M.openTermCurrentDir = function()
    local currentDir = vim.fn.expand('%:p:h')
    
    local tcurrent = Terminal:new {
        dir = currentDir
    }

    tcurrent:toggle()
end

return M
