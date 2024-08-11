vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--
-- Remap J and K in visual mode to move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
-- Key mappings to switch between splits using leader key
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })

-- don't yank when pasting in a selction, or when deleting
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- don't move cursor to end of line when concatenating lines
vim.keymap.set("n", "J", "mzJ`z")

-- center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- reload lsp
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- change all occorunces of current word in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- command completion with arrow keys and enter to select
vim.api.nvim_set_keymap("c", "<Up>", "<C-p>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<Down>", "<C-n>", { noremap = true, silent = true })
