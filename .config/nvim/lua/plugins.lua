local packer = require("packer")

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("configs.nvim-treesitter")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("configs.telescope")
		end,
	})
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "onsails/lspkind.nvim" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag" })
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("configs.bufferline")
		end,
	})
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "mhinz/vim-startify" })
	use({ "EdenEast/nightfox.nvim", tag = "v1.0.0" })
end)
