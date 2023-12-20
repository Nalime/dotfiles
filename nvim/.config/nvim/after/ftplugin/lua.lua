-- https://www.reddit.com/r/neovim/comments/pl0p5v/comment/hc78cye
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')
