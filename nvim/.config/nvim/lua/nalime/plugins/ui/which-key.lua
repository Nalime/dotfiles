return {
    -- which-key: Key combination hints
    "folke/which-key.nvim",
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufReadPost", "VimEnter" },

    config = function()
        local whichkey = require("which-key")

        whichkey.setup({
            plugins = {
                marks = false,
                registers = false,
            },
        })

        whichkey.add({
            { "<Leader>g", group = "Gitsigns" },
            { "<Leader>l", group = "LSP" },
            { "<Leader>O", group = "Obsidian" },
            { "<Leader>t", group = "Telescope" },
        })
    end,
}
