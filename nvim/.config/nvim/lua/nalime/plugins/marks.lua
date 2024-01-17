return {
    -- marks: Marks QoL; show marks on the SignColumn
    "chentoast/marks.nvim",
    event = "VeryLazy",

    config = function()
        local marks = require("marks")

        -- Fix modificator.nvim coloring problem
        -- https://github.com/mawkler/modicator.nvim#marksnvim
        vim.api.nvim_set_hl(0, "MarkSignNumHL", {})

        marks.setup({

        })
    end,
}
