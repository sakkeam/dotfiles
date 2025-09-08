require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.cmd("update")
		end)
	end,
})
