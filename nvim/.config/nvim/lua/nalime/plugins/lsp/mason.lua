return {
    -- mason: Package manager in Neovim
    -- Great for OS-agnostic package syncing
    "williamboman/mason.nvim",
    version = "*",

    config = function()
        local mason = require("mason")

        mason.setup({})
    end,
}
