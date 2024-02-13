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
-- The shift mappings are for when Shift is released too late
add("i", "{<CR>",   "{<CR>}<Esc>O",  "Make {} block")
add("i", "{<S-CR>", "{<CR>}<Esc>O",  "Make {} block")
add("i", "{;",      "{<CR>};<Esc>O", "Make {}; block")
add("i", "{:",      "{<CR>};<Esc>O", "Make {}; block")
add("i", "{,",      "{<CR>},<Esc>O", "Make {}, block")
add("i", "{<",      "{<CR>},<Esc>O", "Make {}, block")

-- Easier access to "+ register
add({"n", "v"}, "<Leader>p", '"+p', '[Quick] "+p')
add({"n", "v"}, "<Leader>P", '"+P', '[Quick] "+P')
add({"n", "v"}, "<Leader>y", '"+y', '[Quick] "+y')
add({"n", "v"}, "<Leader>Y", '"+Y', '[Quick] "+Y')
add({"n", "v"}, "<Leader>d", '"+d', '[Quick] "+d')
add({"n", "v"}, "<Leader>D", '"+D', '[Quick] "+D')

-- Emacs-style (lol) command-line editing
rm("c", "<C-b>")
add_ns("c", "<C-a>", "<Home>",    "To start")
-- add_ns("c", "<C-e>", "<End>",     "To end")
add_ns("c", "<C-b>", "<Left>",    "Prev character")
add_ns("c", "<C-f>", "<Right>",   "Next character")
add_ns("c", "<A-b>", "<S-Left>",  "Prev word")
add_ns("c", "<A-f>", "<S-Right>", "Next word")

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

add("n", "<Leader>r",
    "<Cmd>Telescope oldfiles<CR>",
    "Open recent files")

add("n", "<Leader>f",
    "<Cmd>Telescope live_grep<CR>",
    "Live grep")

add("n", "<Leader>b",
    "<Cmd>Telescope buffers<CR>",
    "Show open buffers")

add("n", "<Leader>u",
    "<Cmd>UndotreeToggle<CR>",
    "Open undo tree")

-- LSP
-- Prefix: l

add("n", "<Leader>ld",
    "<Cmd>lua vim.lsp.buf.definition()<CR>",
    "Jump to definition")

add("n", "<Leader>lk",
    "<Cmd>lua vim.lsp.buf.hover()<CR>",
    "Show info of current symbol")

add("n", "<Leader>la",
    "<Cmd>lua vim.lsp.buf.code_action()<CR>",
    "Select available code action on current line")

add("n", "<Leader>lf",
    "<Cmd>lua vim.lsp.buf.format()<CR>",
    "Auto-format")

add("n", "<Leader>lw",
    "<Cmd>lua vim.diagnostic.open_float()<CR>",
    "Expand diagnostic on current line")

add("n", "<Leader>lp",
    '<Cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    "Previous diagnostic")

add("n", "<Leader>ln",
    '<Cmd>lua vim.diagnostic.goto_next()<CR>',
    "Next diagnostic")

add("n", "<Leader>lv",
    '<Cmd>Navbuddy<CR>',
    "Open code navigation")

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

add("n", "<Leader>gs",
    "<Cmd>Gitsigns stage_hunk<CR>",
    "Stage current hunk")

add("n", "<Leader>gu",
    "<Cmd>Gitsigns undo_stage_hunk<CR>",
    "Undo last staged hunk")

add("n", "<Leader>gr",
    "<Cmd>Gitsigns reset_hunk<CR>",
    "Reset current hunk")

-- Telescope
-- Prefix: t

add("n", "<Leader>td",
    "<Cmd>Telescope diagnostics<CR>",
    "Show diagnostics")

add("n", "<Leader>tm",
    "<Cmd>Telescope marks<CR>",
    "Show marks")

add("n", "<Leader>tj",
    "<Cmd>Telescope jumplist<CR>",
    "Show jumplist")

add("n", '<Leader>t"',
    "<Cmd>Telescope registers<CR>",
    "Show registers")

-- An alternative to q/ for viewing command history
add("n", "<Leader>t:",
    "<Cmd>Telescope command_history<CR>",
    "Open command history")

add("n", "<Leader>t/",
    "<Cmd>Telescope search_history<CR>",
    "Open search history")

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
