return {
    -- mason-null-ls: Install formatters and linters automatically via Mason
    "jay-babu/mason-null-ls.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            "black",
            "shellcheck",
        },
        automatic_installation = false,
        handlers = {},
    },
}
