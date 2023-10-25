-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- move line or visually selected block - alt+j/k
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line(s) up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line(s) down" })

-- move between panes to left/bottom/top/right
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- nvim tree toggle
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle <CR>", { desc = "[T]ree [T]oggle" })

-- suda
vim.keymap.set("n", "<leader>W", ":SudaWrite <CR>", { desc = "Sudo [W]rite" })

-- trouble
vim.keymap.set(
	"n",
	"<leader>xx",
	":TroubleToggle<cr>",
	{ silent = true, noremap = true, desc = "[X][X]Trouble Toggle" }
)
vim.keymap.set(
	"n",
	"<leader>xw",
	":TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "[X]Trouble [W]orkspace" }
)
vim.keymap.set(
	"n",
	"<leader>xd",
	":TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "[X]Trouble [D]iagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>xl",
	":TroubleToggle loclist<cr>",
	{ silent = true, noremap = true, desc = "[X]Trouble [L]oclist" }
)
vim.keymap.set(
	"n",
	"<leader>xq",
	":TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true, desc = "[X]Trouble [Q]uickfix" }
)
vim.keymap.set(
	"n",
	"gR",
	":TroubleToggle lsp_references<cr>",
	{ silent = true, noremap = true, desc = "Trouble [G]et [R]eferences" }
)

-- Telescope
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev [D]iagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next [D]iagnostics" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
