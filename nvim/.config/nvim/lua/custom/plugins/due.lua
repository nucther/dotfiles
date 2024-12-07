return {
	'nfrid/due.nvim',
	config = function()
		require('due_nvim').setup {
			prescript = 'due: '	
		}
	end,
}
