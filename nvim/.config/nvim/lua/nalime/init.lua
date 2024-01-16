-- Said to be improving plugin load times
vim.loader.enable()

-- Configurations
-- Use `gf` to navigate

-- General
-- ./general/
require("nalime.general.mappings")
require("nalime.general.options")
require("nalime.general.lazy")

print(vim.fn.stdpath("config"))
if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/nalime/local.lua") then
    require("nalime.general.local")
end

-- Plugins
-- ./plugins/

-- LSP stuff
-- ./plugins/lsp/
