local Remap = require("core.keymap")
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

local diagnostic = require("lspsaga.diagnostic")
local sagaopts = { silent = true }
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
nnoremap("gh", "<cmd>Lspsaga lsp_finder<CR>", sagaopts)

-- Code action
nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>", sagaopts)
vnoremap("<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", sagaopts)

-- Rename
nnoremap("<leader>gr", "<cmd>Lspsaga rename<CR>", sagaopts)

-- Definition preview
nnoremap("<leader>gd", "<cmd>Lspsaga preview_definition<CR>", sagaopts)

-- Show line diagnostics
vnoremap("<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", sagaopts)

-- Show cursor diagnostic
nnoremap("<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", sagaopts)

-- Diagnsotic jump can use `<c-o>` to jump back
nnoremap("[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", sagaopts)
nnoremap("]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", sagaopts)

-- Only jump to error
nnoremap("[E", function()
	diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, sagaopts)
nnoremap("]E", function()
	diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, sagaopts)

-- Outline
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>", sagaopts)

-- Hover Doc
nnoremap("<leader>K", "<cmd>Lspsaga hover_doc<CR>", sagaopts)

-- Float terminal
nnoremap("<A-d>", "<cmd>Lspsaga open_floaterm<CR>", sagaopts)
tnoremap("<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], sagaopts)
