return {
    "neovim/nvim-lspconfig",
    dependencies = {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
    },
    config = function()
	require("mason").setup {
	    ui = {
		icons = {
		    package_installed = "✓",
		    package_pending = "➜",
		    package_uninstalled = "✗"
		}
	    }
	}


	require("mason-lspconfig").setup{
	    ensure_installed = { 
		"lua_ls", 
		"ts_ls",
		"pylsp",
	    },
	    handlers = {
		function(server_name)
		    require('lspconfig')[server_name].setup {}
		end
	    }
	}


	-- Keymaps
	vim.keymap.set("n", "grr", function()
	    vim.lsp.buf.references()
	end)
	
	vim.keymap.set("n","grn", function()
	    vim.lsp.buf.rename()
	end)

	vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
	vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

    end,
}
