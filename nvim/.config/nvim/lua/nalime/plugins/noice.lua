return {
    -- noice: Customize the UI for messages, cmdline, and popupmenu
    "folke/noice.nvim",
    version = "*",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- I only want `mini`
        -- "rcarriga/nvim-notify",
    },
    event = "VeryLazy",

    opts = {},
}
