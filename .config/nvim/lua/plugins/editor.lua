return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "n", "x", "o" }, false },
    },
    opts = {
      vscode = false,
    },
  },

  {
    "topaxi/gh-actions.nvim",
    keys = {
      { "<leader>ga", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    ---@type GhActionsConfig
    opts = {},
  },
  {
    "chrisbra/csv.vim",
  },
}
