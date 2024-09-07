return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter', 
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		require("render-markdown").setup {
			code = {
				enabled = true,
				sign = false,
				style = 'full',
				position = 'right',
				disable_background = { 'diff' },
				width = 'full',
				left_pad = 0,
				right_pad = 0,
				min_width = 0,
				border = 'thin',
				above = '▄',
				below = '▀',
				highlight = 'RenderMarkdownCode',
				highlight_inline = 'RenderMarkdownCodeInline',
			},
			checkbox = { 
				enabled= true,
				custom = {
					questionmark = { raw = "[?]", rendered = "󰞋 "},
					todo = { raw = "[>]", rendered = "󰧚 "},
					exclamationmark = { raw = "[!]", rendered = " "}
				}
			}
		}
	end,
}
