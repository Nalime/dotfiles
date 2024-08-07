-- Numbers
-- ruler is off in favor of lualine
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.ruler = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Context around cursor
vim.opt.scrolloff = 5

-- Show column guide @ column 80
vim.opt.colorcolumn = { 80 }

-- Full-width window bars
vim.opt.fillchars = "vert:█"

-- Show tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = "tab:»·,trail:·"

-- Delays
vim.opt.timeoutlen = 500
vim.opt.updatetime = 100

-- File backup
vim.opt.backup = true
vim.opt.backupdir = { vim.fn.stdpath("state") .. "/backup//" }

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = { vim.fn.stdpath("state") .. "/undo//" }
vim.opt.undolevels = 999999

-- Always show signcolumn (for plugins)
vim.opt.signcolumn = "yes"

-- Hide vanilla mode display (in favor of lualine)
vim.opt.showmode = false

-- Cursorline (for plugins)
vim.opt.cursorline = true

-- Disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
