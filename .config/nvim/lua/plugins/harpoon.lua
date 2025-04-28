return {
	"theprimeagen/harpoon",
	keys = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		local keys = {
			{ "<leader>ha", mark.add_file, desc = "Toggle [HA]rpoon" },
			{ "<leader>hm", ui.toggle_quick_menu, desc = "Toggle [H]arpoon [M]enu" }
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. i,
				function()
					ui.nav_file(i)
				end,
				desc = "Toggle harpoon [" .. i .. "]",
			})
		end

		return keys
	end,
}
