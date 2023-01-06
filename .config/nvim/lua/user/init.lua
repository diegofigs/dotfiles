require("user.options")
require("user.keymaps")
require("user.completion")
require("user.lsp")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
