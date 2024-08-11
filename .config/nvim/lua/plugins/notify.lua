return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 5000,
			top_down = true,
		})
		-- dismiss notifications
		vim.keymap.set(
			"n",
			"<leader>n",
			':lua require("notify").dismiss({ silent = true, pending = true })<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
