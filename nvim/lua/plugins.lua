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
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/vim-vsnip"
end)
