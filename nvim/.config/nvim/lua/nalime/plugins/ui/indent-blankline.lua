return {
    -- indent-blankline: Indent guides and scope boundaries
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    version = "*",
    event = { "BufReadPost", "VimEnter" },

    opts = {
        exclude = {
            filetypes = {
                "",
                "checkhealth",
                "help",
                "lspinfo",
                "man",
                "packer",
                "undotree",
            },
        },
        viewport_buffer = { min = 300, max = 500 },
    },
}
