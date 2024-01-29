return {
    -- hardtime: Keystroke efficiency hints
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = "VeryLazy",

    opts = {
        max_time = 500,
        max_count = 3,
        disable_mouse = false,
        allow_different_key = true,

        disabled_filetypes = {
            "alpha",
            "lazy",
            "mason",
            "netrw",
            "qf",
            "query",
            "tsplayground",
            "undotree",
            "DressingInput",
        },
    },
}
