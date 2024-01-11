return {
    -- nvim-treesitter: Online parser in Neovim
    -- Syntax highlighting and more
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "python",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
        playground = {
            enable = true,
            disable = {},
        },
    }
}
