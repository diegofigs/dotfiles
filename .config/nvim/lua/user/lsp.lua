-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
	nmap("<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, "[F]ormat")
end

local servers = {
	tsserver = {},
	eslint = {},
	tailwindcss = {},
	cssls = {},
	cssmodules_ls = {},
	astro = {},
	bashls = {},
	terraformls = {},
	lua_ls = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
			diagnostics = { globals = { "vim", "awesome" } },
		},
	},
	jsonls = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json",
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
	yamlls = {
		yaml = {
			-- Schemas https://www.schemastore.org
			schemas = {
				["http://json.schemastore.org/gitlab-ci.json"] = { ".gitlab-ci.yml" },
				["https://json.schemastore.org/bamboo-spec.json"] = {
					"bamboo-specs/*.{yml,yaml}",
				},
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
					"docker-compose*.{yml,yaml}",
				},
				["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
				["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/stylelintrc.json"] = ".stylelintrc.{yml,yaml}",
				["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
			},
		},
	},
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			on_attach(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

require("lspconfig").solidity_ls_nomicfoundation.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.diagnostics.luacheck.with({
			extra_args = { "--globals", "vim,awesome" },
		}),
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.beautysh,
	},
	on_attach = on_attach,
})
