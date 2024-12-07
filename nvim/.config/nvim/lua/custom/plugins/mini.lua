return { 
	"echasnovski/mini.nvim",
	config = function()
		require('mini.notify').setup()
		require('mini.icons').setup()
		require('mini.completion').setup()
		require('mini.pairs').setup()
		require('mini.comment').setup()
		require('mini.move').setup()
	end
}
