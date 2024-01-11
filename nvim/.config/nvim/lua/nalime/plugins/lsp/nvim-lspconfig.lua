return {
    -- nvim-lspconfig: Configure LSP servers
    "neovim/nvim-lspconfig",
    version = "*",

    config = function()
        local lspconfig = require("lspconfig")

        -- For server configurations, visit either:
        -- :h lspconfig-all
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

        lspconfig["bashls"].setup({})
        lspconfig["clangd"].setup({})
        lspconfig["cmake"].setup({})

        lspconfig["lua_ls"].setup({
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

        lspconfig["pyright"].setup({
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        })

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
            -- disable virtual text
            virtual_text = true,
            -- show signs
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
