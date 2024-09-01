local map = vim.keymap.set

map("n", "Q", "<nop>", { desc = "Do nothing on Shift-Q" })
map("n", "<C-i>", "<C-i>", { noremap = true, silent = true, desc = "Make sure CTRL+i is not confused with Tab in Vim" })

map({ "n", "i" }, "<C-z>", "<CMD>undo<CR>", { desc = "Undo" })
map({ "n", "i" }, "<C-y>", "<CMD>redo<CR>", { desc = "Redo" })

map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down one" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up one" })

map("n", "J", ":m+<CR>==", { silent = true, desc = "Move line down one" })
map("n", "K", ":m-2<CR>==", { silent = true, desc = "Move line up one" })

-- Move Lines
map("n", "<A-Down>", "<CMD>m .+1<CR>==", { desc = "Move Down" })
map("n", "<A-Up>", "<CMD>m .-2<CR>==", { desc = "Move Up" })
map("i", "<A-Down>", "<ESC><CMD>m .+1<CR>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<ESC><CMD>m .-2<CR>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

map("n", "+", "<C-a>", { silent = true, desc = "Increment number" })
map("n", "-", "<C-x>", { silent = true, desc = "Decrement number" })

map("n", "<C-a>", "ggVG", { silent = true, desc = "Select all" })

map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in place when half page jumping down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in place when half page jumping up" })

map("n", "n", "nzzzv", { desc = "Goto next entry in search" })
map("n", "N", "Nzzzv", { desc = "Goto previous entry in search" })

-- Navigate buffers
map("n", "]b", "<CMD>bnext<CR>", { desc = "Goto next buffer" })
map("n", "[b", "<CMD>bprev<CR>", { desc = "Goto previous buffer" })
map("n", "<leader><Tab>", "<CMD>bnext<CR>", { desc = "Goto next buffer" })
map("n", "<leader><S-Tab>", "<CMD>bprev<CR>", { desc = "Goto previous buffer" })
map("n", "<leader><Delete>", "<CMD>bdel<CR>", { desc = "Remove current buffer" })

map("n", "<C-b>\"", "<CMD>split<CR>", { desc = "Split pane horizontally" })
map("n", "<C-b>%", "<CMD>vsplit<CR>", { desc = "Split pane veertically" })
-- Move to split using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Navigate left on split window view" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Navigate down on split window view" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Navigate up on split window view" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Navigate right on split window view" })

map({ "n", "o", "x" }, "H", "^", { noremap = true, silent = true, desc = "Jump to beginning of text on the line" })
map({ "n", "o", "x" }, "L", "g_", { noremap = true, silent = true, desc = "Jump to end of line" })

map("x", "p", [["_dP]], { desc = "Paste without overwritting current copy buffer" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy" })

map({ "i", "v" }, "<C-c>", "<Esc>", { desc = "Escape to Normal Mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

map("n", "<Tab>", ">>", { desc = "Indent line" })
map("n", "<S-Tab>", "<<", { desc = "Unindent line" })
map("i", "<S-Tab>", "<C-D>", { desc = "Unindent line" })

map({ "n", "v" }, "<C-b>", "<CMD>Oil<CR>", { desc = "Toggle Nvim Tree" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- map("n", "<C-f>", "<CMD>silent !tmux neww tmux-sessionizer<CR>")
-- map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })

-- map("n", "<C-k>", "<CMD>cnext<CR>zz")
-- map("n", "<C-j>", "<CMD>cprev<CR>zz")
-- map("n", "<leader>k", "<CMD>lnext<CR>zz")
-- map("n", "<leader>j", "<CMD>lprev<CR>zz")

map("v", "<C-f>", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Do a search for hilighted text" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<CMD>!chmod +x %<CR>", { silent = true })

--[[ if oil isn't default file explorer
map("n", "<leader>cdr", "<CMD>e ~/Repos<CR><CMD>cd %:p:h<CR>", { desc = "Goto Repo" })
map("n", "<leader>cds", "<CMD>e ~/.config/nvim<CR><CMD>cd %:p:h<CR>", { desc = "Goto Settings" })
map("n", "<leader>ccc", "<CMD>!code %:p:h<CR>", { desc = "Open current directory in VS Code" })

map("n", "<leader>set", "<CMD>cd %:p:h<CR>", { desc = "Set current path as Vim root" })
--]]

map("n", "<leader>cds", "<CMD>e ~/.config/nvim<CR><CMD>lua require('oil.actions').cd.callback({ silent = true })<CR>", { desc = "Goto Settings" })
map("n", "<leader>cdr", "<CMD>e ~/Repos<CR><CMD>lua require('oil.actions').cd.callback({ silent = true })<CR>", { desc = "Goto Repo" })
map("n", "<leader>set", "<CMD>lua require('oil.actions').cd.callback({ silent = true })<CR>", { desc = "Set current path as Vim root" })
