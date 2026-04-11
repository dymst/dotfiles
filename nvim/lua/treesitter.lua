-- nvim-treesitter `main` branch API.
--
-- On `main`, there is no `require("nvim-treesitter.configs").setup()` —
-- you install parsers via `require("nvim-treesitter").install()` and
-- attach highlighting per-buffer via `vim.treesitter.start()` from a
-- FileType autocmd. Indentation is opt-in via `indentexpr`.

local parsers = {
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

-- Install (or update) parsers. This is async and idempotent — on warm
-- starts where everything is already installed it's effectively a no-op.
require("nvim-treesitter").install(parsers)

-- Attach treesitter highlighting + indent to any buffer whose filetype
-- has a parser available. Using a filetype-agnostic autocmd plus pcall
-- avoids having to map every parser name to its Vim filetype (e.g.
-- `latex` parser vs `tex` filetype) and degrades gracefully on first
-- startup when install() is still fetching parsers in the background.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
