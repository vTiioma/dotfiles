return {}

--[[
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "Cliffback/netcoredbg-macOS-arm64.nvim",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    local widgets = require("dap.ui.widgets")

    local map = vim.keymap.set
    local listeners = dap.listeners.before

    require("netcoredbg-macOS-arm64").setup(require("dap"))
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    listeners.attach.dapui_config = function() ui.open() end
    listeners.launch.dapui_config = function() ui.open() end
    listeners.event_terminated.dapui_config = function() ui.close() end
    listeners.event_exited.dapui_config = function() ui.close() end

    vim.fn.sign_define("DapBreakpoint", { text="", texthl="DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointCondition", { text="", texthl="DiagnosticInfo" })
    vim.fn.sign_define("DapLogPoint", { text="", texthl="DiagnosticInfo" })
    vim.fn.sign_define("DapStopped", { text="", texthl="DiagnosticWarn" })
    vim.fn.sign_define("DapBreakpointRejected", { text="", texthl="DiagnosticError" })

    -- vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
    -- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
    -- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
    -- vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
    -- vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })

    map("n", "<Leader>?", function() ui.eval(nil, { enter = true }) end)
    map("n", "<F5>", function() dap.continue() end)
    map("n", "<F10>", function() dap.step_over() end)
    map("n", "<F11>", function() dap.step_into() end)
    map("n", "<F12>", function() dap.step_out() end)
    map("n", "<Leader>dc", function() dap.continue() end)
    map("n", "<Leader>do", function() dap.step_over() end)
    map("n", "<Leader>di", function() dap.step_into() end)
    map("n", "<Leader>dO", function() dap.step_out() end)
    map("n", "<Leader>b", function() dap.toggle_breakpoint() end)
    map("n", "<Leader>B", function() dap.clear_breakpoints() end)
    map("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
    map("n", "<Leader>dr", function() dap.repl.open() end)
    map("n", "<Leader>dl", function() dap.run_last() end)
    map({"n", "v"}, "<Leader>dh", function() widgets.hover() end)
    map({"n", "v"}, "<Leader>dp", function() widgets.preview() end)
    map("n", "<Leader>df", function() widgets.centered_float(widgets.frames) end)
    map("n", "<Leader>ds", function() widgets.centered_float(widgets.scopes) end)
  end
}
]]--
