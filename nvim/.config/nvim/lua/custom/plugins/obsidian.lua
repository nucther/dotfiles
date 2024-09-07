return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		require("obsidian").setup {
			workspaces = {
				{
					name = "Personal",
					path = "~/Documents/personal/Notes"
				},
				{
					name = "Sandbox",
					path = "~/.config/obsidian/Obsidian Sandbox"
				},
			},
			--disable_frontmatter = true
		}

		vim.opt.conceallevel = 1
	end,
}

