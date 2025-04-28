return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	config = true,
	keys = {
		{
			"gF",
			mode = { "n", "v" },
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			desc = "[F]ormat file",
		},
	},
	opts = {
		stop_after_first = true,
		formatters_by_ft = {
			javascript = { "prettier", "prettierd" },
			typescript = { "prettier", "prettierd" },
			javascriptreact = { "prettier", "prettierd" },
			typescriptreact = { "prettier", "prettierd" },
			vue = { "prettier", "prettierd" },
			css = { "prettier", "prettierd" },
			scss = { "prettier", "prettierd" },
			html = { "prettier", "prettierd" },
			json = { "prettier", "prettierd" },
			yaml = { "prettier", "prettierd" },
			markdown = { "prettier", "prettierd" },
			graphql = { "prettier", "prettierd" },
			lua = { "stylua" },
		},
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	async = false,
		-- 	timeout_ms = 500,
		-- },
	},
}
