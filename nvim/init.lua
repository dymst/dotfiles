require("plugins")

require("custom-keymaps")
require("mason-config")
require("neovim-tree")

vim.opt.clipboard = "unnamedplus"
vim.cmd("colorscheme industry")
vim.cmd("source ~/.vimrc")
