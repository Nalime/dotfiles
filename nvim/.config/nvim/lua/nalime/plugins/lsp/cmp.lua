local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
    Text = "󰊄",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "󰌆",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "󰉺",
}

local select_confirm = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Insert,
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    select = false,
})

local select_next = function(fallback)
    if not cmp.select_next_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end
end

local select_prev = function(fallback)
    if not cmp.select_prev_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end
end

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "calc" },
        { name = "path" },
        { name = "latex_symbols" },
    },
    mapping = {
        ["<CR>"] = cmp.mapping(select_confirm),
        ["<C-n>"] = cmp.mapping(select_next, { "i" }),
        ["<C-p>"] = cmp.mapping(select_prev, { "i" }),
        ["<Tab>"] = cmp.mapping(select_next, { "i", "c" }),
        ["<S-Tab>"] = cmp.mapping(select_prev, { "i", "c" }),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-b>"] = cmp.mapping.scroll_docs(-5),
    },
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

            -- This concatenates the icons with the name of the item kind
            vim_item.kind = string.format(
                "%s %s",
                kind_icons[vim_item.kind],
                vim_item.kind
            )

            return vim_item
        end,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" }
            }
        }
    }),
})
