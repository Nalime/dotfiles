-- Said to be improving plugin load times
vim.loader.enable()

-- Configurations
-- Use `gf` to navigate

-- General
-- ./general/
require("nalime.general.mappings")
require("nalime.general.options")
require("nalime.general.lazy") -- ordering

-- Plugins
-- ./plugins/

-- LSP stuff
-- ./plugins/lsp/
