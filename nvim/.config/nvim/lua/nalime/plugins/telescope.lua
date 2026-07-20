return {
    -- telescope: Fuzzy finder and more
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Telescope",

    opts = {
        defaults = {
            borderchars = {
                prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
                preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            path_display = { "smart" },
            layout_strategy = "center",
            layout_config = {
                anchor = "S",
                height = 0.7,
                width = function(_, max_columns, _)
                    return math.min(math.floor(max_columns * 0.95), 120)
                end,
            },
            results_title = false,
            sorting_strategy = "ascending",
        },
    },
}
