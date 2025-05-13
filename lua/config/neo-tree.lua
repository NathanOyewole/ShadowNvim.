-- lua/config/neotree.lua
require("neo-tree").setup({
  close_if_last_window = true, -- auto close if it's the last window
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  default_component_configs = {
    indent = {
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      default = "",
    },
    git_status = {
      symbols = {
        added     = "✚",
        modified  = "",
        deleted   = "✖",
        renamed   = "➜",
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      }
    },
  },

  window = {
    position = "left",
    width = 32,
    mappings = {
      ["<space>"] = "toggle_node",
      ["<cr>"] = "open",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["a"] = "add",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["q"] = "close_window",
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = { "node_modules", "__pycache__" },
    },
    follow_current_file = { enabled = true }, -- auto reveal file
    use_libuv_file_watcher = true, -- fast updates
  },

  buffers = {
    follow_current_file = { enabled = true },
    show_unloaded = true,
  },

  git_status = {
    window = {
      position = "float",
    },
  },
})
