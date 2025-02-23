return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	-- opts = opts,
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	config = function()
		require("flash").setup({
			search = { multi_window = false },
			modes = {
				treesitter = { highlight = { backdrop = false } },
				char = { enabled = false },
				search = { enabled = true, highlight = { backdrop = true } },
			},
		})
		local orange = "#FAB388"
		local red = "#F38BA9"
		vim.api.nvim_set_hl(0, "FlashLabel", { fg = red, bold = true })
		vim.api.nvim_set_hl(0, "FlashCurrent", { fg = orange, bold = true })
	end,
}
