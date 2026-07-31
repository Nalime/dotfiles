return {
    -- LuaSnip: Snippet engine
    "L3MON4D3/LuaSnip",
    version = "*",
    build = "make install_jsregexp",
    event = "VeryLazy",

    config = function()
        local ls = require("luasnip")

        -- Add silent keymap
        local add_key = function(mode, key, action)
            vim.keymap.set(mode, key, action, {
                noremap = true,
                silent = true,
            })
        end

        add_key({"i"}, "<C-'>", function()
            ls.expand()
        end)

        add_key({"i", "s"}, "<C-;>", function()
            ls.jump(1)
        end)

        add_key({"i", "s"}, "<C-,>", function()
            ls.jump(-1)
        end)

        ls.setup({
            update_events = "TextChanged,TextChangedI",
        })

        require("luasnip.loaders.from_lua").load({
            paths = vim.fn.stdpath("config")
                .. "/lua/nalime/plugins/lsp/luasnip-snippets"
        })
    end
}
