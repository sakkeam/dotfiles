return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})

			local Terminal = require("toggleterm.terminal").Terminal

			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float",
				hidden = true,
			})

			function _G._lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<Leader>g",
				"<Cmd>lua _lazygit_toggle()<CR>",
				{ silent = true, noremap = true }
			)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({})

			vim.api.nvim_set_keymap("n", "<Leader>F", "<Cmd>FzfLua files<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>FzfLua git_files<CR>", { noremap = true })
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
