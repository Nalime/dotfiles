local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

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
