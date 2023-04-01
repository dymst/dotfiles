local configs = require("nvim-treesitter.configs")

local languages = {
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
}

for _, lang in ipairs(languages) do
    configs.ensure_intalled(lang)
end

