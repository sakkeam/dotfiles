require("config.lazy")

vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = {
	eol = "↵",
	tab = "»-",
	space = "·",
	trail = "-",
	extends = "»",
	precedes = "«",
	nbsp = "%",
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

vim.opt.undofile = true

vim.g.mapleader = " "

vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<End><CR>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up><End><CR>", { noremap = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<Leader>B", "<Cmd>bdelete<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>N", "<Cmd>bprevious<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>Q", "<Cmd>quitall<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>S", "<Cmd>vsplit<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>W", "<Cmd>wall<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>Z", "<Cmd>wqall<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>h", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<Leader>j", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<Leader>k", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<Leader>l", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<Leader>n", "<Cmd>bnext<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>q", "<Cmd>quit<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>s", "<Cmd>split<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tl", "<Cmd>set list!<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tp", "<Cmd>set paste!<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>w", "<Cmd>write<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>z", "<Cmd>wq<CR>", { noremap = true })

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.cmd("update")
		end)
	end,
})
