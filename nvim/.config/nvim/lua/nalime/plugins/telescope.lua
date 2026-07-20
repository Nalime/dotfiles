return {
    -- telescope: Fuzzy finder and more
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",

    config = function()
        local telescope = require("telescope")

        telescope.setup({
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
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            },
        })

        telescope.load_extension("fzf")
    end
}
