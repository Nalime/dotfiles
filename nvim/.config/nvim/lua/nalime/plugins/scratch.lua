return {
    -- scratch.vim: (Vim plugin) Easy scratch window
    "mtth/scratch.vim",
    event = "VeryLazy",

    init = function()
        vim.g.scratch_top = 0
        vim.g.scratch_height = 5
        vim.g.scratch_persistence_file = '~/A/nvim_scratch.txt'
    end,
}
