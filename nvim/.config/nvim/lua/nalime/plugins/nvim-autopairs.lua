return {
    -- nvim-autopairs: Autopairs brackets, quotes, etc
    -- Currently disabled since it gets in the way too much
    -- It also messes up with undo history
    "windwp/nvim-autopairs",
    enabled = false,

    config = function()
        local autopairs = require("autopairs")

        autopairs.setup({})
    end,
}
