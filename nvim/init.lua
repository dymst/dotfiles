-- disable netrw at the very start (required by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("colorscheme industry")

require("plugins")

local function safe_require(module)
  local success, err = pcall(require, module)
  if not success then
    print("Error loading " .. module .. ": " .. err)
  end
end

safe_require("keymaps")
safe_require("lsp")
safe_require("tree")
safe_require("treesitter")
safe_require("formatting")
safe_require("completion")

vim.opt.clipboard = "unnamedplus"

-- Settings migrated from .vimrc
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- JSON formatting helper
vim.api.nvim_create_user_command("Pj", "%!python3 -m json.tool", {})
