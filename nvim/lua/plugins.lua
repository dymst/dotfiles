local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },

  -- Syntax highlighting via nvim-treesitter `main` branch (the modern
  -- rewrite). Parsers are compiled from bundled C sources using `cc`,
  -- so no tree-sitter CLI dependency. Setup lives in lua/treesitter.lua.
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- Formatter
  "stevearc/conform.nvim",

  -- Git related
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  { "lewis6991/gitsigns.nvim", lazy = false },

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- Snacks.nvim (Modern utilities including high-res image support)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup({
        image = { enabled = true },
      })
    end,
  },
})
