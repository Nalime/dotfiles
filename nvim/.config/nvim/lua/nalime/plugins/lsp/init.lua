return {
    -- cmp extensions
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-nvim-lua",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-buffer",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-calc",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-path",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-cmdline",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },
    {
        "kdheepak/cmp-latex-symbols",
        dependencies = "hrsh7th/nvim-cmp",
        event = "VeryLazy",
    },

    {
        "neovim/nvim-lspconfig",
        version = "*",
        event = "VeryLazy",
    },
}
