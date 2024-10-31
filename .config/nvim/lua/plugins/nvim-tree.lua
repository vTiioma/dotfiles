return {}

--[[
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')
      local map = vim.keymap.set

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      map(
        { "n", "v" },
        "<C-b>",
        api.tree.toggle,
        opts("Toggle")
      )

      map(
        { "n", "v" },
        "<leader><BS>",
        api.tree.change_root_to_parent,
        opts("Up")
      )

      map(
        { "n", "v" },
        "<leader><leader>",
        api.tree.change_root_to_node,
        opts("CD")
      )
    end,
  },
}
]]--
