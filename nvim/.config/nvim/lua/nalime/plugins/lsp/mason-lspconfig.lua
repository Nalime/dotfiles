return {
    -- mason-lspconfig: Install LSP servers automatically via Mason
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = "williamboman/mason.nvim",
    event = "VeryLazy",

    opts = {
        automatic_enable = false,
        ensure_installed = {
            "bashls",
            "clangd",
            "cmake",
            "jsonls",
            "ts_ls",
            "ltex",
            "lua_ls",
            "marksman",
            "pyright",
        },
    },
}
