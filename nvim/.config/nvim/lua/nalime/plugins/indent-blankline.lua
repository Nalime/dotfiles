return {
    -- indent-blankline: Indent guides and scope boundaries
    "lukas-reineke/indent-blankline.nvim",
    version = "*",
    event = "VeryLazy",

    config = function()
        local indent_blankline = require("ibl")

        indent_blankline.setup({
            exclude = {
                filetypes = {
                    "",
                    "checkhealth",
                    "help",
                    "lspinfo",
                    "man",
                    "packer",
                    "undotree",
                },
            },
        })
    end,
}
