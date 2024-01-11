return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
    },

    -- vim-bbye: Better buffer closing
    -- Main use is to prevent also closing the displaying window
    { "moll/vim-bbye", event = "VeryLazy" },
}
