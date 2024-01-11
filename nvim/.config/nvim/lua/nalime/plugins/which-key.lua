return {
    -- which-key: Key combination hints
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
        local whichkey = require("which-key")

        whichkey.setup({
            triggers_nowait = {
                -- marks
                -- "`",
                -- "'",
                -- "g`",
                -- "g'",
                -- registers
                -- '"',
                -- "<c-r>",
                -- spelling
                -- "z=",
            },
        })

        whichkey.register({
            b = {
                name = "Buffers traversal",
            },
            g = {
                name = "Gitsigns",
            },
            l = {
                name = "LSP",
            },
            O = {
                name = "Obsidian",
            },
        }, { prefix = "<Leader>" })
    end,
}
