local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
    return
end

obsidian.setup({
    dir = "~/A/obsidian-vault",
    notes_subdir = "00 Working",
    daily_notes = {
        folder = "02 Daily",
        date_format = "%Y-%m-%d",
        template = "10 Technical/Templates/Daily Template",
    },
    note_id_func = function(title)
        if title ~= nil then
            return title
        else
            return tostring(os.time())
        end
    end,
    disable_frontmatter = true,
    templates = {
        subdir = "10 Technical/Templates",
        time_format = "%H:%M:%S",
    },
    open_app_foreground = true,
})
