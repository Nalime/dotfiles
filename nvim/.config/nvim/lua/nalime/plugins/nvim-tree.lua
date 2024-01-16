return {
    -- nvim-tree: Better file explorer
    "kyazdani42/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",

    config = function()
        local nvimtree = require("nvim-tree")

        vim.cmd [[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]]

        nvimtree.setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                number = true,
                relativenumber = true,
            },
        })
    end,
}
