local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Clean terminal display",
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		vim.bo.filetype = "terminal"
		vim.b.miniindentscope_disable = true

		if vim.api.nvim_get_mode().mode ~= "i" then 
		    local cf = vim.fn.expand("%:p")
		    local cp = vim.fn.fnamemodify(cf, ":h")
		end
	end,
})

vim.keymap.set("t", "<esc><esc>", "<C-\\><c-n>")
