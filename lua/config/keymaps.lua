vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git Status" })