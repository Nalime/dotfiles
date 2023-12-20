local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    return
end

local mlc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlc_status_ok then
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

mason.setup({

})

mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "lua_ls",
        "pyright",
    },
    automatic_installation = true,
})

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
