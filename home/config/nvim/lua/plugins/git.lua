return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>d",
				"<Cmd>DiffviewFileHistory %<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<Leader>D", "<Cmd>DiffviewClose<CR>", { silent = true, noremap = true })
		end,
	},
}
