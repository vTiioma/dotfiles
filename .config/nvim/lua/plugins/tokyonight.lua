--[[
colorscheme tokyonight

-- There are also colorschemes for the different styles.
colorscheme tokyonight-night
colorscheme tokyonight-storm
colorscheme tokyonight-day
colorscheme tokyonight-moon
--]]

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    style = "moon",
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function(PluginSpec, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
