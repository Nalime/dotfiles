return {
    -- leetcode: Practice (non-in-contest) LeetCode problems in Neovim
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Leet",

    config = function()
        local lc = require("leetcode")

        -- Add silent keymap
        local add_key = function(mode, key, action, desc)
            vim.keymap.set(mode, key, action, {
                noremap = true,
                silent = true,
                desc = desc,
            })
        end

        -- Only enabled in LeetCode context
        add_key("n", "<C-'>", "<Cmd>Leet run<CR>", "[LeetCode] Run code")
        add_key("n", "<C-CR>", "<Cmd>Leet submit<CR>", "[LeetCode] Submit code")
        add_key("n", "<C-/>", "<Cmd>Leet console<CR>", "[LeetCode] Show console")

        lc.setup({
            editor = {
                reset_previous_code = false,
            },
            console = {
                open_on_runcode = false,
            },
            description = {
                width = "50%",
            },
            image_support = true,
            keys = {
                reset_testcases = "M",
            },
        });
    end,
}
