return {
    -- nvim-navbuddy: Navigate code structure
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        -- "numToStr/Comment.nvim",        -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
    },
    event = "VeryLazy",

    opts = {
        window = {
            size = "90%",       -- Or table format example: { height = "40%", width = "100%"}
            sections = {
                left = {
                    size = "20%",
                },
                mid = {
                    size = "30%",
                },
            },
        },
        lsp = {
            auto_attach = true,   -- If set to true, you don't need to manually use attach function
        },
    },
}
