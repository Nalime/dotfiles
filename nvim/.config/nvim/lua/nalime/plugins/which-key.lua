return {
    -- which-key: Key combination hints
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
        local whichkey = require("which-key")

        whichkey.setup({
            plugins = {
                marks = false,
                registers = false,
            },
        })

        whichkey.register({
            g = {
                name = "Gitsigns",
            },
            l = {
                name = "LSP",
            },
            O = {
                name = "Obsidian",
            },
            t = {
                name = "Telescope",
            },
        }, { prefix = "<Leader>" })
    end,
}
