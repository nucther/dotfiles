return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			-- schema information
			"b0o/schemastore.nvim",
		},
		config = function()
			if vim.g.obsidian then
				return
			end

			local lspconfig = require 'lspconfig'

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local languages = {
				bashls = true,
				lua_ls = true,
				ts_ls = {
					filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
					cmd = { "typescript-language-server", "--stdio" }
				},
				pylsp = true,
				gopls = true
			}


			for name, config in pairs(languages) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
				  capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			-- Mason Start setup
			require('mason').setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
			local ensure_installed = {
				"lua_ls",
				"bashls",
				"ts_ls"
			}

			vim.list_extend( ensure_installed, languages)
			require("mason-lspconfig").setup {
				ensure_installed = ensure_installed,
				automatic_installation = true
			}
		end,
	},
}
