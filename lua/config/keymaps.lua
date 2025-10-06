local map = vim.keymap.set
local silent = { silent = true, noremap = true }
local opts = { silent = true }

-- Window resizing (Alt + arrows)
map("n", "<A-Left>", ":vertical resize -5<CR>", silent)
map("n", "<A-Right>", ":vertical resize +5<CR>", silent)
map("n", "<A-Up>", ":resize +3<CR>", silent)
map("n", "<A-Down>", ":resize -3<CR>", silent)

-- Window nav like your <leader>a / <leader>d
map("n", "<leader>a", "<C-w>h", silent)
map("n", "<leader>d", "<C-w>l", silent)

-- Buffer prev/next (leader q/e)
map("n", "<leader>q", ":bprevious<CR>", silent)
map("n", "<leader>e", ":bnext<CR>", silent)

-- Finder: use commands so we don't require telescope at startup
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

-- NERDTree  Neo-tree
map("n", "<leader>n", ":Neotree toggle<CR>", silent)

-- Tagbar  Aerial
map("n", "<F8>", ":AerialToggle!<CR>", silent)

-- Diagnostics nav like ALE (Ctrl-j/k)
map("n", "<C-j>", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<C-k>", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- LSP common (keep refs via Telescope command)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Split navigation
map("n", "<C-Right>", "<C-w>l", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)

-- Buffer navigation (Ctrl+Shift+Arrows)
map("n", "<C-S-Right>", ":bnext<CR>", opts)
map("n", "<C-S-Left>", ":bprevious<CR>", opts)
-- Some terminals report the modifiers reversed; add aliases just in case
map("n", "<S-C-Right>", ":bnext<CR>", opts)
map("n", "<S-C-Left>", ":bprevious<CR>", opts)
