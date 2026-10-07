-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.termguicolors = true

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.title = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- vim.opt.expandtab = false
vim.opt.expandtab = true

-- Always show tabs
vim.opt.showtabline = 1

-- Make empty space visible
vim.opt.conceallevel = 0

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

-- Enable smart indenting
vim.opt.breakindent = true

-- Disable text wrap
vim.opt.wrap = false

-- Disable hilighting search term
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
	eol = "",
	tab = "›·",
	lead = "·",
	trail = "·",
	nbsp = "␣",
	extends = "»",
	precedes = "«",
}

-- Save undo history
vim.opt.undofile = true

-- Enable ignorecase + smartcase for better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.opt.completeopt = { "menuone", "noselect" }
-- see `:h completeopt`
vim.opt.completeopt = "fuzzy,menuone,noinsert,popup"

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Remove column line
vim.opt.colorcolumn = "0"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append('@-@')

vim.diagnostic.config({ virtual_lines = true })
