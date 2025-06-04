return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	require('lualine').setup {
		theme = 'tokyonight',
		sections = {
			lualine_a = {'buffers'},
			lualine_b = {'mode'},
			lualine_c = {},
			lualine_x = {'diff','branch'},
			lualine_y = {'filetype'},
			luanine_z = {}
		}
	}
    end,
}


