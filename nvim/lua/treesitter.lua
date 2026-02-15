-- Ensure nvim-treesitter uses the container's compatible binary.
-- nvim-treesitter internally uses vim.fn.exepath("tree-sitter") for 'generate',
-- which bypasses the 'command' setting and picks up host-mounted binaries.
if vim.fn.filereadable("/usr/local/bin/tree-sitter") == 1 then
  local ts_install = require("nvim-treesitter.install")
  ts_install.command = "/usr/local/bin/tree-sitter"

  -- Monkey-patch exepath specifically for tree-sitter to force the container binary
  local old_exepath = vim.fn.exepath
  vim.fn.exepath = function(expr)
    if expr == "tree-sitter" then
      return "/usr/local/bin/tree-sitter"
    end
    return old_exepath(expr)
  end
end
require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "cmake",
    "cpp",
    "cuda",
    "dockerfile",
    "go",
    "json",
    "latex",
    "make",
    "markdown",
    "python",
    "r",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
}
