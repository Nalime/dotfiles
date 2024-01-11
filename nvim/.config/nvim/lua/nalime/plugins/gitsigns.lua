return {
    -- gitsigns: Show Git hunks
    "lewis6991/gitsigns.nvim",
    version = "*",

    config = function()
        local gitsigns = require("gitsigns")

        require("scrollbar.handlers.gitsigns").setup()

        gitsigns.setup({})
    end,
}
