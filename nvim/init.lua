require("plugins")

require("custom-keymaps")
require("mason-config")
require("neovim-tree")
require("treesitter-config")

vim.opt.clipboard = "unnamedplus"
vim.cmd("colorscheme industry")
vim.cmd("source ~/.vimrc")
