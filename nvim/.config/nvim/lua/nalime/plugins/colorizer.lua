return {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    event = { "BufReadPost", "VimEnter" },

    opts = {
        user_default_options = {
            RRGGBBAA = true, -- #RRGGBBAA hex codes
            AARRGGBB = true, -- 0xAARRGGBB hex codes
            css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        },
    },
}
