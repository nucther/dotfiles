return {
    "echasnovski/mini.nvim",
    config = function()
	require('mini.completion').setup()
	require('mini.comment').setup()
	require('mini.pairs').setup()
	require('mini.indentscope').setup()
	require('mini.ai').setup()
	require('mini.surround').setup()
    end
}
