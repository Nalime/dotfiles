return {
    -- telescope: Fuzzy finder and more
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",

    config = function()
        local telescope = require("telescope")

        telescope.setup({})
    end,
}
