return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
							},
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("CursorHold", {
				pattern = "*",
				callback = function()
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					for _, client in ipairs(clients) do
						if client.server_capabilities.hoverProvider then
							vim.lsp.buf.hover({ focusable = false, border = "rounded", silent = true })
						end
					end
				end,
			})
		end,
		dependencies = {
			"cmp-nvim-lsp",
			"nvim-cmp",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"lua_ls",
				"stylua",

				-- rust
				"bacon",
				"bacon_ls",
				"rust_analyzer",
			},
		},
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})

			vim.api.nvim_set_keymap(
				"n",
				"<Leader>tx",
				"<Cmd>Trouble diagnostics toggle focus=true<CR>",
				{ silent = true, noremap = true }
			)
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { lsp_format = "fallback" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({})

			vim.keymap.set("n", "<Leader>to", "<cmd>Outline<CR>")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = {},
	},
	{
		"mfussenegger/nvim-lint",
	},
}
