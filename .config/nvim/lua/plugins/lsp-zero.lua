return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  event = "InsertEnter",
  config = function()
    local lsp = require("lsp-zero")

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      -- see :help lsp-zero-keybindings
      -- to learn the available actions 
      lsp.default_keymaps({ buffer = bufnr })

      vim.keymap.set("n", "?", vim.lsp.buf.hover, vim.tbl_deep_extend("force", opts, { desc = "Hover" }))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_deep_extend("force", opts, { desc = "[G]et [D]efinition" }))
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_deep_extend("force", opts, { desc = "[G]et [D]eclaration" }))
      vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_deep_extend("force", opts, { desc = "[G]et [R]eferences" }))
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_deep_extend("force", opts, { desc = "[G]et [I]mplementation" }))
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts, { desc = "[R]e[N]ame" }))
      vim.keymap.set("n", "<leader>diag", vim.diagnostic.setloclist, vim.tbl_deep_extend("force", opts, { desc = "Show [DIAG]nostics" }))
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_deep_extend("force", opts, { desc = "[C]ode [A]ction" }))
    end)
  end,
}
