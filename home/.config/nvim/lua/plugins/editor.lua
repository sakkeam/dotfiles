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
	{
		"goolord/alpha-nvim",
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"abecodes/tabout.nvim",
		opts = {},
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
	{
		"zbirenbaum/copilot-cmp",
		opts = true,
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.scroll_docs(-1),
					["<C-k>"] = cmp.mapping.scroll_docs(1),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<Esc>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"zbirenbaum/copilot-cmp",
		},
	},
}
