local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Clean terminal display",
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		vim.bo.filetype = "terminal"
	end,
})

local termID = 0
vim.keymap.set("t", "<esc><esc>", "<C-\\><c-n>")
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
	termID = vim.bo.channel
end)

vim.keymap.set("n", "<C-\\>", function()
		vim.api.nvim_buf_set_option(termID, "hidden", false)
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 15)
end)
