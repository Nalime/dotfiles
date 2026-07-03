return {
    -- none-ls (null-ls): Formatters and linters
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "gbprod/none-ls-shellcheck.nvim",
    },
    event = "VeryLazy",

    config = function()
        local null_ls = require("null-ls")

        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local hover = null_ls.builtins.hover
        local completion = null_ls.builtins.completion

        null_ls.setup({
            -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
            -- https://github.com/nvimtools/none-ls.nvim/discussions/81
            sources = {
                -- General
                formatting.prettierd,

                -- Lua
                diagnostics.selene,
                formatting.stylua,

                -- Python
                formatting.black,

                -- Shell
                require("none-ls-shellcheck.diagnostics"),
                require("none-ls-shellcheck.code_actions"),
                formatting.shfmt,
            },
        })
    end,
}
