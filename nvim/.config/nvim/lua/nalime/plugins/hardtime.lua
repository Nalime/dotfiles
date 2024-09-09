return {
    -- hardtime: Keystroke efficiency hints
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "VimEnter" },

    opts = {
        max_time = 100,
        max_count = 2,
        disable_mouse = false,
        allow_different_key = true,

        restricted_keys = {
            ["<Up>"] = { "n", "x" },
            ["<Down>"] = { "n", "x" },
            ["<Left>"] = { "n", "x" },
            ["<Right>"] = { "n", "x" },
        },
        disabled_keys = {
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },

        disabled_filetypes = {
            "alpha",
            "lazy",
            "mason",
            "netrw",
            "qf",
            "query",
            "tsplayground",
            "undotree",
            "DressingInput",
        },

        hints = {
            -- https://github.com/m4xshen/hardtime.nvim/discussions/42
            ["[dcyvV][ia][%(%)]"] = {
                message = function(keys)
                    return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
                end,
                length = 3,
            },
            ["[dcyvV][ia][{}]"] = {
                message = function(keys)
                    return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
                end,
                length = 3,
            },
        },
    },
}
