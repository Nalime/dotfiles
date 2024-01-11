-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

local plugins = {
    { import = "nalime.themes" },
    { import = "nalime.plugins" },
    { import = "nalime.plugins.lsp" },
}

local config = {
    change_detection = { notify = false },
}

lazy.setup(plugins, config)
