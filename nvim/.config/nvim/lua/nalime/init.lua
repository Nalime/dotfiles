-- Said to be improving plugin load times
vim.loader.enable()

-- Configurations
-- Use `gf` to navigate

-- General
-- ./general/
require("nalime.general.mappings")
require("nalime.general.options")
require("nalime.general.packer")
require("nalime.general.theme")

-- Plugins
-- ./plugins/
require("nalime.plugins.bufferline")
require("nalime.plugins.cmp")
require("nalime.plugins.gitsigns")
require("nalime.plugins.indent-blankline")
require("nalime.plugins.lsp")
require("nalime.plugins.lsp-handler").setup()
require("nalime.plugins.lualine")
require("nalime.plugins.null-ls")
require("nalime.plugins.nvim-autopairs")
require("nalime.plugins.nvim-tree")
require("nalime.plugins.obsidian")
require("nalime.plugins.scrollbar")
require("nalime.plugins.surround")
require("nalime.plugins.telescope")
require("nalime.plugins.treesitter")
require("nalime.plugins.undotree")
require("nalime.plugins.which-key")
