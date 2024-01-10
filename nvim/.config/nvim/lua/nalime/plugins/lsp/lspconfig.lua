local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

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
