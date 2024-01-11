return {
    -- mason-lspconfig: Install LSP servers automatically via Mason
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    dependencies = "williamboman/mason.nvim",

    enabled = false,

    config = function()
        local mason_null_ls = require("mason-null-ls")

        mason_null_ls.setup({

        })
    end,
}
