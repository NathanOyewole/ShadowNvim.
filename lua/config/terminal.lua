return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = 15,
        open_mapping = [[<C-\>]],
        direction = "horizontal", -- "vertical" | "float" | "tab"
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
      }

      -- Optional: toggle with keymaps
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
}
