return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- "nvim-neotest/neotest-plenary",
      "MisanthropicBit/neotest-busted",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = {
        -- "neotest-plenary",
        "neotest-busted",
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        "rustaceanvim.neotest",
        ["neotest-vitest"] = {},
      }
    end,
  },
}
