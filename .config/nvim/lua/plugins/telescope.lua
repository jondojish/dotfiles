return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local actions = require("telescope.actions")

		local builtin = require("telescope.builtin")

		local function build_find_command(ignored_patterns)
			local command = { "rg", "--files", "--hidden" }

			-- Add each ignore pattern with --iglob
			for _, pattern in ipairs(ignored_patterns) do
				table.insert(command, "--iglob")
				table.insert(command, pattern)
			end

			return command
		end

		-- Define ignored patterns
		local ignored = {
			"!.git",
			"!**/venv/*",
			"!**/build/*",
			"!**/target/*",
			"!**/dist/*",
		}
		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({
				find_command = build_find_command(ignored),
			})
		end, { desc = "Search files" })
		vim.keymap.set("n", "<leader>pc", function()
			local config_dir = vim.env.HOME .. "/.config/nvim"
			builtin.find_files({
				find_command = { "rg", "--files", "--iglob", "!.git", "--hidden", config_dir },
				previewer = false,
			})
		end, { desc = "Config files" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Search Git files" })
		-- vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep in project" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = "" })
		end, { desc = "Grep in project" })
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Grep in buffer" })
		vim.keymap.set("n", "<leader>pk", "<cmd>Telescope keymaps<cr>", { desc = "Search keybinds" })
		require("telescope").setup({
			defaults = {
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
						["<C-j>"] = actions.move_selection_next, -- Move down
						["<C-k>"] = actions.move_selection_previous, -- Move up
						-- ["<C-d>"] = actions.results_scrolling_down, -- Scroll down
						-- ["<C-u>"] = actions.results_scrolling_up, -- Scroll up
					},
					i = {
						["<C-q>"] = function(prompt_bufnr)
							local open_with_trouble = require("trouble.sources.telescope").open
							open_with_trouble(prompt_bufnr)
						end,
						["<C-j>"] = actions.move_selection_next, -- Move down
						["<C-k>"] = actions.move_selection_previous, -- Move up
						-- ["<C-d>"] = actions.results_scrolling_down, -- Scroll down
						-- ["<C-u>"] = actions.results_scrolling_up, -- Scroll up
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
