return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- diagnostics = {
      --   virtual_text = {
      --     prefix = "■",
      --   },
      -- },
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = false,
      },
      setup = {
        jsonls = function(_, opts)
          ---@param client vim.lsp.Client
          opts.on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.documentSymbolProvider = false
          end
        end,
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
      servers = {
        nginx_language_server = {},
        nil_ls = {},
        solidity_ls_nomicfoundation = {},
        ruff = {
          init_options = {
            settings = {
              filetypes = { "python", "bash", "sh" },
            },
          },
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    dependencies = {
      "gbprod/none-ls-luacheck.nvim",
    },
    opts = function(_, opts)
      vim.list_extend(opts.sources or {}, {
        require("none-ls-luacheck.diagnostics.luacheck"),
      })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
