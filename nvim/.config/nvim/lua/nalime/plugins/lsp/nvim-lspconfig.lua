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

        vim.lsp.config("bashls", {})
        vim.lsp.config("clangd", {})
        vim.lsp.config("cmake", {})
        vim.lsp.config("jsonls", {})

        vim.lsp.config("ltex_plus", {
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
        })

        vim.lsp.config("lua_ls", {
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
        })

        vim.lsp.config("marksman", {})

        vim.lsp.config("pyright", {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        })

        vim.lsp.config("ts_ls", {})

        local signs = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
        }

        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "rounded",
            }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = "rounded",
            }
        )
    end,
}
