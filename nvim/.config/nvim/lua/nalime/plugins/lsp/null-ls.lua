return {
    -- none-ls: Formatters and linters
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {

            },
        })
    end,
}
