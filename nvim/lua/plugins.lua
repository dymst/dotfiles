return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use {
		"williamboman/mason.nvim",
		run = ":MaisonUpdate"
	}
	use "williamboman/mason-lspconfig.nvim"

	use "neovim/nvim-lspconfig"

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		}
	}

	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim"
		}
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = function() local ts_update = require("nvim-treesitter.install").update({ with_sync = true }) ts_update() end,
	}

	use "kdheepak/lazygit.nvim"

	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use "hrsh7th/cmp-path"
end)
