return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons' },
  },
  opts = {
    -- extensions = {
    --   ['ui-select'] = {
    --     require('telescope.themes').get_dropdown(),
    --   },
    -- },
		defaults = {
			path_display = {
				filename_first = {
					reverse_directories = true,
				},
			},
			mappings = {
				n = {
					["d"] = require("telescope.actions").delete_buffer,
					["q"] = require("telescope.actions").close,
				}
			},
		},
  },
  keys = {
		{
			"<leader>fb",
			"<CMD>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>",
			-- "<CMD>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<CR>",
			desc = "[F]ind [B]uffer",
		},
    {
      "<leader>fr",
      function()
        require("telescope.builtin").resume({})
      end,
      desc = "[F]ind [R]esume",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").live_grep({})
      end,
      desc = "[F]ind [S]pecific text in files",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin")
          .find_files(require("telescope.themes")
            .get_dropdown({ previewer = false }))
      end,
      desc = "[F]uzzy [F]ind files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin")
          .git_files(require("telescope.themes")
            .get_dropdown({ previewer = false }))
      end,
      desc = "[F]ind [G]it files",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin")
					.find_files(require('telescope.themes')
						.get_dropdown({ cwd = vim.fn.stdpath "config" }))
      end,
      desc = "[F]ind [C]onfig files",
    },
    {
      "<leader>/",
      function()
        -- You can pass additional configuration to telescope to change theme, layout, tc.
        require("telescope.builtin")
					.current_buffer_fuzzy_find(require("telescope.themes")
						.get_dropdown({
							winblend = 10,
							previewer = false,
						}))
      end,
      desc = "[/] Fuzzy search in current buffer",
    },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    --[[
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files(themes.get_dropdown { previewer = false })
    end, { desc = "[F]uzzy [F]ind files" })
    vim.keymap.set("n", "<leader>fg", function()
      builtin.git_files(themes.get_dropdown { previewer = false })
    end, { desc = "[F]ind [G]it files" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]pecific text in files" })
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[F]ind [C]onfig files" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, tc.
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "[/] Fuzzy search in current buffer" })
    --]]
  end,
}
