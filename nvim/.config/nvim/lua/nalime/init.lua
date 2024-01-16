-- Said to be improving plugin load times
vim.loader.enable()

-- Configurations
-- Use `gf` to navigate

-- General
-- ./general/
require("nalime.general.mappings")
require("nalime.general.options")
require("nalime.general.lazy")

local local_conf = vim.fn.stdpath("config") .. "/lua/nalime/general/local.lua"
if vim.fn.filereadable(local_conf) == 1 then
    require("nalime.general.local")
end

-- Plugins
-- ./plugins/

-- LSP stuff
-- ./plugins/lsp/
