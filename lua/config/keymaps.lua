vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
