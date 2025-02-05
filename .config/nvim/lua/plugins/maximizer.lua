return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
	},
	config = function()
		require("windows").setup()
		vim.keymap.set(
			"n",
			"<leader>f",
			":WindowsMaximize<CR>",
			{ desc = "Toggle window maximize", noremap = true, silent = true }
		)
		vim.cmd(":WindowsDisableAutowidth")
	end,
}
