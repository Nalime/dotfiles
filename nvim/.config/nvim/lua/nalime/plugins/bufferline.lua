return {
    -- bufferline: Bufferline
    -- Shows open buffers in order
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
        local bufferline = require("bufferline")

        vim.opt.termguicolors = true

        bufferline.setup({
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
        })
    end,
}
