-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
})

-- Install your plugins here
-- Tip: :checkhealth to run all plugin health checks
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Common dependencies
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

    -- Colorscheme darkplus
    use "LunarVim/Colorschemes"

    -- nvim-treesitter: Online parser in Neovim
    -- Syntax highlighting and more
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end,
    }
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-context"

    -- bufferline: Bufferline
    -- Shows open buffers in order
    use {
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons",
    }

    -- lualine: Statusline
    -- A fancy replacement of (Neo)Vim's vanilla status bar
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    }

    -- nvim-tree: Better file explorer
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    }

    -- telescope: Fuzzy finder and more
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- mason: Package manager in Neovim
    -- Great for OS-agnostic package syncing
    use "williamboman/mason.nvim"

    -- cmp (and its extensions): Completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-calc"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "kdheepak/cmp-latex-symbols"

    -- X-lspconfig: Extended LSP configuration support
    -- LSP = Language server protocol
    use "neovim/nvim-lspconfig"
    use "williamboman/mason-lspconfig.nvim"

    -- nvim-dap: DAP
    -- DAP = Debug adapter protocol
    -- use "mfussenegger/nvim-dap"
    -- use "rcarriga/nvim-dap-ui"

    -- null-ls: Formatters and linters
    use "jose-elias-alvarez/null-ls.nvim"

    -- nvim-surround: Surround text objects with things (e.g. brackets)
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability;
        -- omit to use `main` branch for the latest features
    }

    -- gitsigns: Show Git hunks
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("scrollbar.handlers.gitsigns").setup()
        end,
    }

    -- undotree: Undo tree traversal and visualization
    use "mbbill/undotree"

    -- which-key: Key combination hints
    use "folke/which-key.nvim"

    -- indent-blankline: Indent guides and scope boundaries
    use "lukas-reineke/indent-blankline.nvim"

    -- vim-bbye: Better buffer closing
    -- Main use is to prevent also closing the displaying window
    use "moll/vim-bbye"

    -- obsidian: Obsidian commands and completions
    use {
        "epwalsh/obsidian.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            { "hrsh7th/nvim-cmp", opt = true },
            { "nvim-telescope/telescope.nvim", opt = true },
        },
    }

    -- nvim-scrollbar: Scrollbar
    -- Also shows git marks, warnings, errors
    use "petertriho/nvim-scrollbar"

    -- nvim-autopairs: Autopairs brackets, quotes, etc
    -- Currently disabled since it gets in the way too much
    -- It also messes up with undo history
    -- use "windwp/nvim-autopairs"
end)
