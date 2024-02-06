return {
    -- nvim-treesitter: Online parser in Neovim
    -- Syntax highlighting and more
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    version = "*",
    event = "VeryLazy",

    opts = {
        ensure_installed = "all",
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
}
