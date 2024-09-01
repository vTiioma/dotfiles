return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- default_file_explorer = false,
    default_file_explorer = true,
    keymaps = { ["<leader><BS>"] = "actions.parent" },
    columns = { "icon" },
    view_options = { show_hidden = true },
  },
}
