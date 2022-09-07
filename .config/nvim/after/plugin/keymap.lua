local Remap = require("diegofigs.keymap")
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

-- move line or visually selected block - alt+j/k
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- move between panes to left/bottom/top/right
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Find files using Telescope command-line sugar.
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

local diagnostic = require("lspsaga.diagnostic");
local saga_opts = { silent = true }
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>", saga_opts)

-- Code action
nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>", saga_opts)
vnoremap("<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", saga_opts)

-- Rename
nnoremap("<leader>gr", "<cmd>Lspsaga rename<CR>", saga_opts)

-- Definition preview
nnoremap("<leader>gd", "<cmd>Lspsaga preview_definition<CR>", saga_opts)

-- Show line diagnostics
vnoremap("<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", saga_opts)

-- Show cursor diagnostic
nnoremap("<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", saga_opts)

-- Diagnsotic jump can use `<c-o>` to jump back
nnoremap("[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", saga_opts)
nnoremap("]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", saga_opts)

-- Only jump to error
nnoremap("[E", function()
	diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, saga_opts)
nnoremap("]E", function()
	diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, saga_opts)

-- Outline
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>", saga_opts)

-- Hover Doc
nnoremap("<leader>K", "<cmd>Lspsaga hover_doc<CR>", saga_opts)

-- Float terminal
nnoremap("<A-d>", "<cmd>Lspsaga open_floaterm<CR>", saga_opts)
tnoremap("<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], saga_opts)
