local resolve_obsidian_image = function(document_path, image_path, fallback)
    if document_path:find(vim.g.obsidian_root, 1, true) then
        local name = vim.split(image_path, "|", {plain = true})[1]
        local path = vim.fs.find(name,
            {path = vim.g.obsidian_media})[1]
        if path then
            return path
        end
    end
    return fallback(document_path, image_path)
end

return {
    "3rd/image.nvim",
    version = "*",
    build = false,
    event = "VeryLazy",

    opts = {
        integrations = {
            markdown = {
                resolve_image_path = resolve_obsidian_image,
            },
        },
    },
}
