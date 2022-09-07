local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-lua/plenary.nvim")
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("nvim-treesitter/nvim-treesitter")
Plug("nvim-telescope/telescope.nvim")
Plug("neovim/nvim-lspconfig")
Plug("glepnir/lspsaga.nvim", { branch = "main" })
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")
Plug("nvim-lualine/lualine.nvim")
Plug("kyazdani42/nvim-web-devicons")
Plug("kyazdani42/nvim-tree.lua")
Plug("mhinz/vim-startify")
Plug("morhetz/gruvbox")
Plug("EdenEast/nightfox.nvim", { tag = "v1.0.0" })

vim.call("plug#end")

vim.cmd("colorscheme nightfox")

require("diegofigs")
