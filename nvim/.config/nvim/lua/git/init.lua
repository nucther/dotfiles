local M = {}

M.gfp = function()
    vim.ui.input({ prompt = ' Commit Message: '}, function(v)
        local cc = vim.fn.system('git add . && git commit -m "'..v..'" && git push ')

    end)
end


return M
