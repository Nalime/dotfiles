local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
    playground = {
        enable = true,
        disable = {},
    },
})
