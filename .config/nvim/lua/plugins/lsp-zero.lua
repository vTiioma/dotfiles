return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  event = "InsertEnter",
  config = function()
    print("loaded lsp!")

    local lsp = require("lsp-zero")

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      -- see :help lsp-zero-keybindings
      -- to learn the available actions 
      lsp.default_keymaps({ buffer = bufnr })

      vim.keymap.set("n", "?", function() vim.lsp.buf.hover() end, vim.tbl_deep_extend("force", opts, { desc = "Hover" }))
      vim.keymap.set("n", "<leader>diag", function() vim.diagnostic.setloclist() end, vim.tbl_deep_extend("force", opts, { desc = "Show [DIAG]nostics" }))
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, vim.tbl_deep_extend("force", opts, { desc = "[C]ode [A]ction" }))
    end)
  end,
}
