return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "VonHeikemen/lsp-zero.nvim",
  },
  opts = {
    ensure_installed = {
      "vimls",
      "tsserver",
      "eslint",
      "lua_ls",
      "html",
      "emmet_language_server",
    },
    handlers = {
      require("lsp-zero").default_setup,
      lua_ls = function()
        require("lspconfig").lua_ls.setup(require("lsp-zero").nvim_lua_ls())
      end
    },
  },
}
