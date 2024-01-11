return {
    -- mason-null-ls: Install formatters and linters automatically via Mason
    "jay-babu/mason-null-ls.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },

    config = function()
        local mason_null_ls = require("mason-null-ls")

        mason_null_ls.setup({

        })
    end,
}
