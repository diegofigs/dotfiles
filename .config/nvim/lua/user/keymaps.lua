-- move line or visually selected block - alt+j/k
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- move between panes to left/bottom/top/right
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Find files using Telescope command-line sugar.
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")

local diagnostic = require("lspsaga.diagnostic")
local sagaopts = { silent = true }
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", sagaopts)

-- Code action
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", sagaopts)
vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", sagaopts)

-- Rename
vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", sagaopts)

-- Definition preview
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", sagaopts)

-- Show line diagnostics
vim.keymap.set("v", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", sagaopts)

-- Show cursor diagnostic
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", sagaopts)

-- Diagnsotic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", sagaopts)
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", sagaopts)

-- Only jump to error
vim.keymap.set("n", "[E", function()
	diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, sagaopts)
vim.keymap.set("n", "]E", function()
	diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, sagaopts)

-- Outline
vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", sagaopts)

-- Hover Doc
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", sagaopts)

-- Float terminal
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", sagaopts)
vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], sagaopts)
