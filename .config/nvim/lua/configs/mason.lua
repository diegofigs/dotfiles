require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "eslint", "sumneko_lua" },
	automatic_installation = true,
})

