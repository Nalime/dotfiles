return {
    -- nvim-scrollbar: Scrollbar
    -- Also shows git marks, warnings, errors
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",

    config = function()
        local scrollbar = require("scrollbar")

        scrollbar.setup({})
    end,
}
