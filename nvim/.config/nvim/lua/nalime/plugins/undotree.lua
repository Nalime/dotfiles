return {
    -- undotree: Undo tree traversal and visualization
    "mbbill/undotree",

    config = function()
        -- This is a Vim plugin
        -- Therefore, there's no setup() function to invoke
        -- The options also have to be set in the below way

        vim.g.undotree_DiffAutoOpen = 0
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_ShortIndicators = 1
    end,
}
