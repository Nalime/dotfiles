return {
    -- nvim-tree: Better file explorer
    "kyazdani42/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",

    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        view = {
            number = true,
            relativenumber = true,
        },
    },
}
