return {
    -- mason-null-ls: Install formatters and linters automatically via Mason
    "jay-babu/mason-null-ls.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            -- Lua
            "selene", -- linter
            "stylua", -- formatter

            -- Python
            "black", -- formatter

            -- Shell
            "shellcheck", -- linter
            "shfmt", -- formatter
        },
        automatic_installation = false,
        -- > Providing an empty `handlers` will cause all sources to be
        -- > automatically registered in `null-ls`.
        -- handlers = {},
    },
}
