return {
    -- nvim-treesitter: Online parser in Neovim
    -- Syntax highlighting and more
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
    -- version = "*",
    event = "VeryLazy",

    opts = {
        ensure_installed = "all",
        auto_install = false,
        ignore_install = { "ipkg" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
}
