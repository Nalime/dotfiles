return {
    -- nvim-tree: Better file explorer
    "kyazdani42/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",

    opts = {
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        actions = {
            change_dir = {
                enable = true,
                global = true,
            },
            open_file = {
                quit_on_open = true,
            },
        },
        filters = {
            git_ignored = false,
        },
        view = {
            number = true,
            relativenumber = true,
            width = 40,
        },
        update_focused_file = {
            enable = true,
        },
        renderer = {
            icons = {
                glyphs = {
                    folder = {
                        empty = "󰉖",
                        empty_open = "󰷏",
                    },
                },
            },
        },
    },
}
