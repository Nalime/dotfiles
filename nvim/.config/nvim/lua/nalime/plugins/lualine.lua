local spaces = function()
    return "sw: " .. vim.bo.shiftwidth
end

local eol = function()
    if vim.bo.endofline == true then
        return ""
    else
        return ""
    end
end

return {
    -- lualine: Statusline
    -- A fancy replacement of (Neo)Vim's vanilla status bar
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPost", "VimEnter" },

    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                "NvimTree",
                "alpha",
                "diff",
                "tsplayground",
                "undotree",
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                { "filename", path = 1 },
            },
            lualine_x = { spaces, "encoding", eol, "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { spaces, "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    },
}
