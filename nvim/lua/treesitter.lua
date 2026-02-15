require("nvim-treesitter.install").command = "/usr/local/bin/tree-sitter"
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
