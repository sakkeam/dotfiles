return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})

			local Terminal = require("toggleterm.terminal").Terminal

			local brush = Terminal:new({
				cmd = "brush",
				direction = "float",
				hidden = true,
				on_open = function(term)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<Esc><Esc>",
						"<Cmd>close<CR>",
						{ silent = true, noremap = true }
					)
				end,
			})

			function _G._brush_toggle()
				brush:toggle()
			end

			vim.api.nvim_set_keymap("n", "<Leader>t", "<Cmd>lua _brush_toggle()<CR>", { silent = true, noremap = true })

			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float",
				hidden = true,
				on_open = function(term)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"t",
						"<Esc><Esc>",
						"<Cmd>close<CR>",
						{ silent = true, noremap = true }
					)
				end,
			})

			function _G._lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<Leader>a",
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

			vim.api.nvim_set_keymap("n", "<Leader>/", "<Cmd>FzfLua lsp_document_symbols<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>F", "<Cmd>FzfLua files<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>I", "<Cmd>FzfLua blines<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>FzfLua buffers<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>FzfLua git_files<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>g", "<Cmd>FzfLua live_grep<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<Leader>i", "<Cmd>FzfLua lines<CR>", { noremap = true })
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
		"hrsh7th/cmp-emoji",
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
					{ name = "emoji" },
				}, {
					{ name = "buffer" },
				}),
				experimental = {
					ghost_text = true,
				},
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
			"hrsh7th/cmp-emoji",
			"zbirenbaum/copilot-cmp",
		},
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		config = function()
			local hop = require("hop")

			hop.setup({})

			local directions = require("hop.hint").HintDirection

			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR })
			end)
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR })
			end)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"rust",
				},
			})
		end,
	},
	{
		"nvim-lua/plenary.nvim",
		branch = "master",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup({})

			vim.api.nvim_set_keymap("n", "<Leader>c", "<Cmd>CopilotChatToggle<CR>", { silent = true, noremap = true })
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup()

			vim.api.nvim_set_keymap("n", "<Leader>.", "<Cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })
		end,
	},
	{
		"Isrothy/neominimap.nvim",
		version = "v3.x.x",
		lazy = false,
		init = function()
			vim.g.neominimap = {
				click = {
					enabled = true,
				},
			}

			vim.api.nvim_set_keymap("n", "<Leader>m", "<Cmd>Neominimap Toggle<CR>", { silent = true, noremap = true })
		end,
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94E2D5" })
			end)

			require("ibl").setup({
				indent = {
					highlight = highlight,
				},
			})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {},
	},
}
