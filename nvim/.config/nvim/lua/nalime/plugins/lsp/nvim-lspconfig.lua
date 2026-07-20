local configs = {
    -- $Miscellaneous
    cmake = {},
    jsonls = {},
    ltex_plus = {
        on_attach = function(client, bufnr)
            require("ltex_extra").setup({
                load_langs = { "en-US" },
                path = "~/A/ltex",
            })
        end,
        settings = {
            ltex = {
                language = "en-US",
                additionalRules = {
                    enablePickyRules = true,
                },
            },
        },
    },
    marksman = {},

    -- C/C++
    clangd = {},

    -- JS/TS
    eslint = {},
    ts_ls = {},

    -- Lua
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    },

    -- Python
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "off",
                },
            },
        },
    },

    -- Shell
    bashls = {},
}

return {
    -- nvim-lspconfig: Configure LSP servers
    "neovim/nvim-lspconfig",
    dependencies = "williamboman/mason-lspconfig.nvim",
    version = "*",
    event = { "BufReadPost", "VimEnter" },

    config = function()
        -- For server configurations, visit either:
        -- :h lspconfig-all
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

        for lsp, config in pairs(configs) do
            vim.lsp.config(lsp, config)
            vim.lsp.enable(lsp)
        end

        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
