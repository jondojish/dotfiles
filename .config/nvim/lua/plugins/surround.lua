return {
	"tpope/vim-surround",
	config = function()
		-- Add descriptions for vim-surround mappings
		vim.keymap.set("n", "ds", "<Plug>Dsurround", { desc = "Delete surrounding characters" })
		vim.keymap.set("n", "cs", "<Plug>Csurround", { desc = "Change surrounding characters" })
		vim.keymap.set("n", "ys", "<Plug>Ysurround", { desc = "Add surrounding characters" })
		vim.keymap.set("n", "yss", "<Plug>Yssurround", { desc = "Add surrounding characters (whole line)" })
		vim.keymap.set("n", "ySs", "<Plug>YSsurround", { desc = "Add surrounding characters (whole line, line mode)" })
		vim.keymap.set("n", "ySS", "<Plug>YSsurround", { desc = "Add surrounding characters (whole line, line mode)" })
	end,
}
