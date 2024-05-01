vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.smartindent = true
vim.opt.swapfile = false

vim.opt.updatetime = 50

vim.cmd.colorscheme("archery")

vim.opt.showtabline = 2
vim.opt.laststatus = 2

vim.g.airline_theme = "archery"
vim.g.lightline = "archery"

-- i do not understand why this must be set even before lazy.setup
vim.g.wiki_root = '~/wiki'
