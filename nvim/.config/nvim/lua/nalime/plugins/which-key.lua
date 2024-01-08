local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
    return
end

whichkey.setup({
    triggers_nowait = {
        -- marks
        -- "`",
        -- "'",
        -- "g`",
        -- "g'",
        -- registers
        -- '"',
        -- "<c-r>",
        -- spelling
        -- "z=",
    },
})

whichkey.register({
    b = {
        name = "Buffers traversal",
    },
    g = {
        name = "Gitsigns",
    },
    l = {
        name = "LSP",
    },
    O = {
        name = "Obsidian",
    },
}, { prefix = "<Leader>" })
