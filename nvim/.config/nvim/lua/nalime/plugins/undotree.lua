return {
    -- undotree: (Vim plugin) Undo tree traversal and visualization
    "mbbill/undotree",
    cmd = {
        "UndotreeHide",
        "UndotreeShow",
        "UndotreeFocus",
        "UndotreeToggle",
        "UndotreePersistUndo",
    },

    init = function()
        vim.g.undotree_DiffAutoOpen = 0
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_ShortIndicators = 1
    end,
}
