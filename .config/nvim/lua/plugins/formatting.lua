return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        nixpkgs_fmt = { command = "nixpkgs-fmt" },
      },
      formatters_by_ft = {
        nix = { "nixpkgs_fmt" },
      },
    },
  },
}
