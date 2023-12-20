vim.g.transparent_background = true

-- Transparent signcolumn
-- https://github.com/airblade/vim-gitgutter/issues/696#issuecomment-628510154
vim.cmd [[ autocmd ColorScheme * highlight! link SignColumn LineNr ]]

vim.cmd [[
try
    colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]
