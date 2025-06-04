return {
    "folke/tokyonight.nvim",
    lazy = false, 
    config = function()
	require('tokyonight').setup {
	    style = "storm",
	    light_style = "day",
	    transparent = true
	}

	vim.cmd[[colorscheme tokyonight]]

    end
}
