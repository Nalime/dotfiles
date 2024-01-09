-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

lazy.setup({
    -- Colorscheme darkplus
    "LunarVim/Colorschemes",

    -- nvim-treesitter: Online parser in Neovim
    -- Syntax highlighting and more
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
    },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- bufferline: Bufferline
    -- Shows open buffers in order
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- lualine: Statusline
    -- A fancy replacement of (Neo)Vim's vanilla status bar
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- nvim-tree: Better file explorer
    {
        "kyazdani42/nvim-tree.lua",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- telescope: Fuzzy finder and more
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = "nvim-lua/plenary.nvim",
    },

    -- mason: Package manager in Neovim
    -- Great for OS-agnostic package syncing
    { "williamboman/mason.nvim", version = "*", },

    -- cmp (and its extensions): Completion plugins
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "kdheepak/cmp-latex-symbols",

    -- X-lspconfig: Extended LSP configuration support
    -- LSP = Language server protocol
    { "neovim/nvim-lspconfig", version = "*", },
    { "williamboman/mason-lspconfig.nvim", version = "*", },

    -- null-ls: Formatters and linters
    "jose-elias-alvarez/null-ls.nvim",

    -- nvim-surround: Surround text objects with things (e.g. brackets)
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },

    -- gitsigns: Show Git hunks
    {
        "lewis6991/gitsigns.nvim",
        version = "*",
        config = function()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    },

    -- undotree: Undo tree traversal and visualization
    "mbbill/undotree",

    -- which-key: Key combination hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    -- indent-blankline: Indent guides and scope boundaries
    { "lukas-reineke/indent-blankline.nvim", version = "*", },

    -- vim-bbye: Better buffer closing
    -- Main use is to prevent also closing the displaying window
    "moll/vim-bbye",

    -- obsidian: Obsidian commands and completions
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        dependencies = "nvim-lua/plenary.nvim",
    },

    -- nvim-scrollbar: Scrollbar
    -- Also shows git marks, warnings, errors
    "petertriho/nvim-scrollbar",

    -- nvim-autopairs: Autopairs brackets, quotes, etc
    -- Currently disabled since it gets in the way too much
    -- It also messes up with undo history
    -- "windwp/nvim-autopairs",
})
