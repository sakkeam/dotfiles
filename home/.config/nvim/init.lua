require("config.lazy")

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "

vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<Leader>q", "<Cmd>quit<CR>", { noremap = true })

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.cmd("update")
		end)
	end,
})
