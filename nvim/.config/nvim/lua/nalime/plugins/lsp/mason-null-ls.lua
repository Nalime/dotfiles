return {
    -- mason-null-ls: Install formatters and linters automatically via Mason
    "jay-babu/mason-null-ls.nvim",
    version = "*",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            -- Bash
            -- "shellcheck", -- linter
            "shfmt", -- formatter

            -- JavaScript
            "eslint_d", -- linter

            -- Lua
            "selene", -- linter
            "stylua", -- formatter

            -- Markdown
            "marksman",

            -- Python
            "black", -- formatter
        },
        automatic_installation = false,
        handlers = {},
    },
}
