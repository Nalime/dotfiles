return {
    -- ltex_extra: Supplementing ltex_plus
    "barreiroleo/ltex_extra.nvim",
    dependencies = "neovim/nvim-lspconfig",
    ft = {
        "Text",
        "Markdown",
        "LaTeX",
        "reStructuredText"
    },

    -- settings in lsp/nvim-lspconfig.lua
}
