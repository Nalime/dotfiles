-- Said to be improving plugin load times
vim.loader.enable()

-- Configurations
-- Use `gf` to navigate

-- General
-- ./general/
require("nalime.general.mappings")
require("nalime.general.options")
require("nalime.general.lazy") -- ordering
require("nalime.general.theme")

-- Plugins
-- ./plugins/
require("nalime.plugins.bufferline")
require("nalime.plugins.gitsigns")
require("nalime.plugins.indent-blankline")
require("nalime.plugins.lualine")
-- require("nalime.plugins.nvim-autopairs")
require("nalime.plugins.nvim-tree")
require("nalime.plugins.obsidian")
require("nalime.plugins.scrollbar")
require("nalime.plugins.surround")
require("nalime.plugins.telescope")
require("nalime.plugins.treesitter")
require("nalime.plugins.undotree")
require("nalime.plugins.which-key")

-- LSP stuff
-- ./plugins/lsp/
require("nalime.plugins.lsp.cmp")
require("nalime.plugins.lsp.lsp-handler").setup()
require("nalime.plugins.lsp.lspconfig")
require("nalime.plugins.lsp.mason") -- ordering
require("nalime.plugins.lsp.mason-lspconfig")
require("nalime.plugins.lsp.mason-null-ls")
require("nalime.plugins.lsp.null-ls")
