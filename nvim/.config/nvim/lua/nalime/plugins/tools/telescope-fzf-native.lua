return {
    -- telescope-fzf-native: Support fzf syntax on telescope
    "nvim-telescope/telescope-fzf-native.nvim",
    build = [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
        && cmake --build build --config Release --target install]],
    lazy = true,

    config = function()

    end,
}
