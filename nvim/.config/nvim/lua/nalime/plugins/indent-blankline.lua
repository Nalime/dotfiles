return {
    -- indent-blankline: Indent guides and scope boundaries
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    version = "*",
    event = "BufReadPost",

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
    },
}
