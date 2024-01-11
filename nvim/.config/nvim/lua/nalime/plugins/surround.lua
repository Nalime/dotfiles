return {
    -- nvim-surround: Surround text objects with things (e.g. brackets)
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",

    config = function()
        local surround = require("nvim-surround")

        surround.setup({})
    end,
}
