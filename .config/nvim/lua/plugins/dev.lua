return {
  {
    "diegofigs/npackages-node.nvim",
    enabled = false,
    dependencies = {
      "neovim/node-client",
    },
    event = "VeryLazy",
  },

  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.library or {}, {
        "plenary.nvim",
        "nvim-nio",
        "npackages.nvim",
        "gh-actions.nvim",
      })
    end,
  },

  {
    "diegofigs/npackages.nvim",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      ---@type npackages.UserConfig
      vim.g.npackages = {
        -- autostart = false,
        lsp = {
          on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nt", "<cmd>Npackages toggle<cr>", {
              desc = "Toggle Package Versions",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>na", "<cmd>Npackages add<cr>", {
              desc = "Add Package",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nd", "<cmd>Npackages delete<cr>", {
              desc = "Delete Package",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nu", "<cmd>Npackages update<cr>", {
              desc = "Update Package",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nc", "<cmd>Npackages change_version<cr>", {
              desc = "Change Version",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ni", "<cmd>Npackages install<cr>", {
              desc = "Install Package Dependencies",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nr", "<cmd>Npackages refresh<cr>", {
              desc = "Refresh Packages",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nR", "<cmd>Npackages reload<cr>", {
              desc = "Reload Packages",
            })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>nK", "<cmd>Npackages hover<cr>", {
              desc = "Hover (Package/Version)",
            })
          end,
        },
        popup = {
          -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        },
      }
    end,
  },
}
