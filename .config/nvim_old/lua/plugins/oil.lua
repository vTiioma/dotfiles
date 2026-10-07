return {
  'stevearc/oil.nvim',
	lazy = false,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<C-b>", "<CMD>Oil<CR>", desc = "Go to file explorer" }
	},
  opts = {
    -- default_file_explorer = false,
    default_file_explorer = true,
    keymaps = { ["<leader><BS>"] = "actions.parent" },
    columns = { "icon" },
    view_options = { show_hidden = true },
  },
}
