local function get_diagnostic_label(props)
  local icons = {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
  }

  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      local fg = "#"
        ---@diagnostic disable-next-line: deprecated
        .. string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
      table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
    end
  end
  return label
end

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

  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "catppuccin",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "catppuccin" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("catppuccin.palettes.mocha")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = colors.base, guibg = colors.red },
            InclineNormalNC = { guifg = colors.base, guibg = colors.maroon },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },

        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local diagnostics = get_diagnostic_label(props)
          local modified = vim.bo[props.buf].modified
          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

          if modified then
            filename = "[+] " .. filename
          end

          local buffer = {
            { filetype_icon, guifg = color },
            { " " },
            { filename, gui = modified and "bold,italic" or "None" },
          }

          if #diagnostics > 0 then
            table.insert(diagnostics, { "| ", guifg = colors.base })
          end
          for _, buffer_ in ipairs(buffer) do
            table.insert(diagnostics, buffer_)
          end
          return diagnostics
        end,
      })
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  --   { "nvimdev/dashboard-nvim",
  --     event = "VimEnter",
  --     opts = function(_, opts)
  --       local logo = [[
  -- ██████╗ ██╗███████╗ ██████╗  ██████╗ ███████╗██╗ ██████╗ ███████╗
  -- ██╔══██╗██║██╔════╝██╔════╝ ██╔═══██╗██╔════╝██║██╔════╝ ██╔════╝
  -- ██║  ██║██║█████╗  ██║  ███╗██║   ██║█████╗  ██║██║  ███╗███████╗
  -- ██║  ██║██║██╔══╝  ██║   ██║██║   ██║██╔══╝  ██║██║   ██║╚════██║
  -- ██████╔╝██║███████╗╚██████╔╝╚██████╔╝██║     ██║╚██████╔╝███████║
  -- ╚═════╝ ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚══════╝
  --
  --       ]]
  --
  --       logo = string.rep("\n", 8) .. logo .. "\n\n"
  --       opts.config.header = vim.split(logo, "\n")
  --     end,
  --   },

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
    "stevearc/conform.nvim",
    opts = {
      ---@type table<string, conform.FormatterInfo[]>
      formatters = {
        nixpkgs_fmt = { command = "nixpkgs-fmt" },
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        nix = { "nixpkgs_fmt" },
      },
    },
  },
}
