return {
    -- mason-lspconfig: Install LSP servers automatically via Mason
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = "williamboman/mason.nvim",
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            "bashls",
            "clangd",
            "cmake",
            "ltex",
            "lua_ls",
            "marksman",
            "pyright",
        },
        automatic_installation = true,
    },
}
