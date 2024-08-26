local defaults = {
	prompt_prefix = "   ",
	selection_caret = ">",
	entry_prefix = " ",
	sorting_strategy = "ascending",
	layout_config = {
		horizontal = {
			prompt_position = "top",
			preview_width = 0.55,
		},
		width = 0.87,
		height = 0.80,
	},
	mappings = {
		n = {
			["q"] = require("telescope.actions").close,
			["<C-q>"] = function(prompt_bufnr)
				local open_with_trouble = require("trouble.sources.telescope").open
				open_with_trouble(prompt_bufnr)
			end,
		},
		i = {
			["<C-q>"] = function(prompt_bufnr)
				local open_with_trouble = require("trouble.sources.telescope").open
				open_with_trouble(prompt_bufnr)
			end,
		},
	},
}
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } })
		end, {})
		vim.keymap.set("n", "<leader>pc", function()
			local config_dir = vim.env.HOME .. "/.config/nvim"
			builtin.find_files({
				find_command = { "rg", "--files", "--iglob", "!.git", "--hidden", config_dir },
				previewer = false,
			})
		end, {})
		vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
		require("telescope").setup({ defaults = defaults })
	end,
}
