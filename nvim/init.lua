require("plugins")

require("keymaps")
require("lsp")
require("tree")
require("treesitter")
require("formatter")

vim.opt.clipboard = "unnamedplus"
vim.cmd("colorscheme industry")
vim.cmd("source ~/.vimrc")
