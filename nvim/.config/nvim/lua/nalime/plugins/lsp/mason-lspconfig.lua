return {
    -- mason-lspconfig: Install LSP servers automatically via Mason
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    event = "VeryLazy",

    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = {
                "bashls",
                "clangd",
                "cmake",
                "lua_ls",
                "pyright",
            },
            automatic_installation = true,
        })
    end,
}
