--------------------------------
-- Mapping shortcut functions --
--------------------------------

-- General form: {mode, key, action, desc}
-- See :h map-table for modes

-- When does <silent> matter?
-- :h map-silent
-- Basically, silent maps does not show up on the command line
-- Therefore, for commands that expect something after that, don't use silent

-- Silent
local add = function(mode, key, action, desc)
    vim.keymap.set(mode, key, action, {
        noremap = true,
        silent = true,
        desc = desc,
    })
end

-- No-silent
local add_ns = function(mode, key, action, desc)
    vim.keymap.set(mode, key, action, {
        noremap = true,
        desc = desc,
    })
end

-- Remove
local rm = function(mode, key)
    vim.keymap.set(mode, key, "<Nop>", {
        noremap = true,
    })
end

----------------
-- Leader key --
----------------

local leader_key = " "

-- Assign space as leader key
vim.g.mapleader = leader_key
vim.g.maplocalleader = leader_key

-- Disable vanilla <Space>
rm("", leader_key)

----------------------
-- Vanilla mappings --
----------------------

-- Edit config
add("n", "<Leader>\\",
    "<Cmd>e " .. vim.fn.stdpath("config") .. "/lua/nalime/init.lua<CR>",
    "Edit config")

-- Disable vanilla autocompletion
rm("i", "<C-n>")
rm("i", "<C-p>")
rm("c", "<Tab>")
rm("c", "<S-Tab>")

-- Make brace blocks
-- The mapping <S-CR> is for when the Shift key is released too late
add("i", "{<CR>",   "{<CR>}<Esc>O",  "Make {} block")
add("i", "{<S-CR>", "{<CR>}<Esc>O",  "Make {} block")
add("i", "{;",      "{<CR>};<Esc>O", "Make {}; block")

-- Easier access to "+ register
add({"n", "v"}, "<Leader>p", '"+p', '[Quick] "+p')
add({"n", "v"}, "<Leader>P", '"+P', '[Quick] "+P')
add({"n", "v"}, "<Leader>y", '"+y', '[Quick] "+y')
add({"n", "v"}, "<Leader>Y", '"+Y', '[Quick] "+Y')
add({"n", "v"}, "<Leader>d", '"+d', '[Quick] "+d')
add({"n", "v"}, "<Leader>D", '"+D', '[Quick] "+D')

---------------------
-- Plugin mappings --
---------------------

-- Remember to register prefixes in which-key's config
-- Shortcut: `gf` on below path
-- ../plugins/which-key.lua

-- Top-level mappings

add("n", "<Leader>e",
    "<Cmd>NvimTreeToggle<CR>",
    "Open file explorer")

add("n", "<Leader>o",
    "<Cmd>Telescope find_files<CR>",
    "Find files")

add("n", "<Leader>f",
    "<Cmd>Telescope live_grep<CR>",
    "Live grep")

add("n", "<Leader>u",
    "<Cmd>UndotreeToggle<CR>",
    "Open undo tree")

-- Bufferlist traversal
-- Prefix: b

add("n", "<Leader>bp",
    "<Cmd>bprev<CR>",
    "Previous buffer")

add("n", "<Leader>bn",
    "<Cmd>bnext<CR>",
    "Next buffer")

add("n", "<Leader>bq",
    "<Cmd>Bdelete<CR>",
    "Delete current buffer")

-- LSP
-- Prefix: l

add("n", "<Leader>lD",
    "<Cmd>lua vim.lsp.buf.declaration()<CR>",
    "Jump to declaration")

add("n", "<Leader>ld",
    "<Cmd>lua vim.lsp.buf.definition()<CR>",
    "Jump to definition")

add("n", "<Leader>lk",
    "<Cmd>lua vim.lsp.buf.hover()<CR>",
    "Show info of current symbol")

add("n", "<Leader>la",
    "<Cmd>lua vim.lsp.buf.code_action()<CR>",
    "Select available code action on current line")

add("n", "<Leader>ld",
    "<Cmd>lua vim.diagnostic.open_float()<CR>",
    "Expand diagnostic on current line")

add("n", "<Leader>lp",
    '<Cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    "Previous diagnostic")

add("n", "<Leader>ln",
    '<Cmd>lua vim.diagnostic.goto_next()<CR>',
    "Next diagnostic")

-- Gitsigns
-- Prefix: g

add("n", "<Leader>gb",
    "<Cmd>Gitsigns blame_line<CR>",
    "Git blame current line")

add("n", "<Leader>gd",
    "<Cmd>Gitsigns preview_hunk<CR>",
    "Git diff current hunk")

add("n", "<Leader>gp",
    "<Cmd>Gitsigns prev_hunk<CR>",
    "Previous Git hunk")

add("n", "<Leader>gn",
    "<Cmd>Gitsigns next_hunk<CR>",
    "Next Git hunk")

-- Obsidian
-- Prefix: O

add("n", "<Leader>Oa",
    "<Cmd>ObsidianOpen<CR>",
    "Open in Obsidian")

add_ns("n", "<Leader>On",
    "<Cmd>ObsidianNew ",
    "Create Obsidian note named ...")

add("n", "<Leader>Oo",
    "<Cmd>ObsidianQuickSwitch<CR>",
    "Find Obsidian note")

add("n", "<Leader>Of",
    "<Cmd>ObsidianSearch<CR>",
    "Full-text search in Obsidian Vault")

add("n", "<Leader>Ot",
    "<Cmd>ObsidianTemplate<CR>",
    "Insert template")

add("n", "<Leader>Ob",
    "<Cmd>ObsidianBacklinks<CR>",
    "Show backlinks")

add_ns("n", "<Leader>Ol",
    "<Cmd>'<,'>ObsidianLink ",
    "Link to ... at selection")

add_ns("v", "<Leader>Ol",
    "<Cmd>ObsidianLink ",
    "Link to ... at selection")

add("n", "<Leader>Od",
    "<Cmd>ObsidianToday<CR>",
    "To today's daily note")

add("n", "<Leader>Oy",
    "<Cmd>ObsidianYesterday<CR>",
    "To yesterday's daily note")
