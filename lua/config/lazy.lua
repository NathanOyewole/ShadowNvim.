local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 🌌 Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- 🌟 UI
  { "nvim-lualine/lualine.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- 🔭 Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- 🌱 Git Integration
  { "lewis6991/gitsigns.nvim" },

  -- 🧠 Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },

  -- ✂️ Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- 🛠️ LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- 🧊 Dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██║   ██║██║████╗ ████║",
        "██╔██╗ ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██║   ██║██║██║╚██╔╝██║",
        "██║ ╚████║╚██████╔╝██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝     ╚═╝",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("e", "  Explorer", ":Neotree toggle<CR>"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
      }
      dashboard.section.footer.val = "ShadowNvim | Now with LSP and Autocompletion ⚡"
      alpha.setup(dashboard.config)
    end,
  },

  -- 🧘 Zen Mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
    },
  },

  -- 🖥️ Integrated Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = 15,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
      }

      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },
})
