return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- schema information
			"b0o/schemastore.nvim",
		},
		config = function()

			local lspconfig = require 'lspconfig'


			-- Mason Start setup
			require('mason').setup()
		end,
	}
}
