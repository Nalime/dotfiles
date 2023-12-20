local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

indent_blankline.setup({
    exclude = {
        filetypes = {
            "",
            "checkhealth",
            "help",
            "lspinfo",
            "man",
            "packer",
            "undotree",
        },
    },
})
