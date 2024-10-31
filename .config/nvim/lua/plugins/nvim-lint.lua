return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
			html = { "eslint_d" },
			css = { "eslint_d" },
			scss = { "eslint_d" },
			json = { "eslint_d" },
		}

		--[[
    lint.linters_by_ft = {
			javascript = { { "eslint", "eslint_d" } },
			typescript = { { "eslint", "eslint_d" } },
			javascriptreact = { { "eslint", "eslint_d" } },
			typescriptreact = { { "eslint", "eslint_d" } },
			vue = { { "eslint", "eslint_d" } },
			html = { { "eslint", "eslint_d" } },
			css = { { "eslint", "eslint_d" } },
			scss = { { "eslint", "eslint_d" } },
			json = { { "eslint", "eslint_d" } },
		}
    --]]

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.html", "*.css", "*.scss", "*.vue", "*.json" },
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
