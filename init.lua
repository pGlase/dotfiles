--lazy needs mapleader to be set first
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
--install plugins
require("lazy").setup(
    {import = "plugins"}
)

--add remaps
vim.schedule(function()
    require "vim.remaps"
    require "vim.settings"
  end)
