return {
    -- nvim-scrollbar: Scrollbar
    -- Also shows git marks, warnings, errors
    "petertriho/nvim-scrollbar",

    config = function()
        local scrollbar = require("scrollbar")

        scrollbar.setup({})
    end,
}
