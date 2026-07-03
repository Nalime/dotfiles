return {
    -- mason-lspconfig: Install LSP servers automatically via Mason
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = "williamboman/mason.nvim",
    event = "VeryLazy",

    opts = {
        automatic_enable = false,
        ensure_installed = {
            -- $Miscellaneous
            "cmake",
            "jsonls",
            "ltex_plus",
            "marksman",

            -- C/C++
            "clangd",

            -- JS/TS
            "eslint",
            "ts_ls",

            -- Lua
            "lua_ls",

            -- Python
            "pyright",

            -- Shell
            "bashls",
        },
    },
}
