return {
    -- git-conflict: Highlight conflicts and choose a side fast
    "akinsho/git-conflict.nvim",
    version = "*",
    event = { "BufReadPost", "VimEnter" },

    opts = {},
}
