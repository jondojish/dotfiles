return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			on_attach = function()
				local api = require("nvim-tree.api")
				-- default mappings
				api.config.mappings.default_on_attach(bufnr)
				-- unmap filter
				vim.keymap.set("n", "f", "", {})
			end,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				custom = {
					"^\\.git$", -- Hide .git directory
					"^\\.vscode$", -- Hide .vscode directory
					"^\\.pytest_cache$", -- Hide .pytest_cache directory
					"^__pycache__$", -- Example of hiding __pycache__ directory (Python)
				},
			},
		})
	end,
	vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
}
