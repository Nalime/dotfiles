local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

vim.cmd [[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]]

nvimtree.setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
