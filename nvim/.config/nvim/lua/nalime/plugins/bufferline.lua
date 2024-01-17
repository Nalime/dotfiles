return {
    -- bufferline: Bufferline
    -- Shows open buffers in order
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    opts = {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    highlight = "Directory",
                    separator = true,
                },
                {
                    filetype = "undotree",
                    text = "Undo Tree",
                    text_align = "left",
                    highlight = "Directory",
                    separator = true,
                },
            },
        },
        highlights = {
            buffer_selected = {
                italic = false,
            },
        },
    },
}
