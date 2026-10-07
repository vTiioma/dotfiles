return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "VonHeikemen/lsp-zero.nvim",
  },
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "vimls",
      "ts_ls",
      "eslint",
      "lua_ls",
      "html",
      "emmet_language_server",
    },
    handlers = {
      require("lsp-zero").default_setup,
      function(server_name)
        require("lspconfig")[server_name].setup()
      end,
      lua_ls = function()
        require("lspconfig").lua_ls.setup(require("lsp-zero").nvim_lua_ls())
      end
    },
  },
}
