return {
    -- alpha-nvim: Welcome screen
    "goolord/alpha-nvim",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function ()
        local alpha = require("alpha")
        alpha.setup(require("alpha.themes.startify").config)
    end,
};
