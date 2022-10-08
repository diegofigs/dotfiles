require("user.plugins")
require("user.keymaps")
require("user.lsp")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
--vim.cmd("colorscheme nightfox")
