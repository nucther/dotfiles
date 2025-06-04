return {
    'nvim-telescope/telescope.nvim',
    dependencies= {
	'nvim-lua/plenary.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope-live-grep-args.nvim'
    },
    config = function()
	require('telescope').setup{
	    pickers = {
		find_files = {
		    theme = "ivy"
		}
	    }
	}
	vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
	vim.keymap.set("n", "<leader>fd", function()
	    require('telescope.builtin').find_files {
		cwd = vim.fn.expand("%:p:h")
	    }
	end, {desc = "Find files in the current directory"})
	vim.keymap.set("n", "<leader>ff", function()
	    require('telescope.builtin').find_files {
		find_command = {"fd","-H", "--type", "f","--color", "never" }
	    }
	end, {desc = "Find files in the current project directory"})

	vim.keymap.set("n", "<leader>cf", function()
	    require("telescope.builtin").find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end, { desc = "Open neovim config path"})

	vim.keymap.set("n", "<leader>ni", function ()
	    require('telescope.builtin').find_files {
		cwd = "$HOME/Notes/inbox"
	    }
	end, { desc = "Find notes inside Inbox folder"})

	vim.keymap.set("n", "<leader>na", function ()
	    require('telescope.builtin').find_files {
		cwd = "$HOME/Notes"
	    }
	end, { desc = "Find all notes"})

	local x = 5
	print(x)

    end
}
