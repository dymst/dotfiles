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
        "typescript",
        "yaml",
    },
    highlight = {
        enable = true,
    },
}
