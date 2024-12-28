return {
	"github/copilot.vim",
	config = function()
		local opts = { expr = true, silent = true }

		vim.keymap.set("i", "<C-J>", "copilot#Previous()", opts) -- Previous suggestion
		vim.keymap.set("i", "<C-K>", "copilot#Next()", opts) -- Next suggestion
	end,
}
-- tab to complete
