return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>qa", function()
			harpoon:list():add()
		end, { desc = "Add current file to Harpoon list" })
		vim.keymap.set("n", "<leader>qq", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon list" })
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Select buffer 1 from Harpoon" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Select buffer 2 from Harpoon" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Select buffer 3 from Harpoon" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Select buffer 4 from Harpoon" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Select buffer 5 from Harpoon" })
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Select buffer 6 from Harpoon" })

		-- REPLACE INSTEAD OF ADD
		vim.keymap.set("n", "<leader>q1", function()
			harpoon:list():replace_at(1)
		end, { desc = "Replace buffer 1 from Harpoon" })
		vim.keymap.set("n", "<leader>q2", function()
			harpoon:list():replace_at(2)
		end, { desc = "Replace buffer 2 from Harpoon" })
		vim.keymap.set("n", "<leader>q3", function()
			harpoon:list():replace_at(3)
		end, { desc = "Replace buffer 3 from Harpoon" })
		vim.keymap.set("n", "<leader>q4", function()
			harpoon:list():replace_at(4)
		end, { desc = "Replace buffer 4 from Harpoon" })
		vim.keymap.set("n", "<leader>q5", function()
			harpoon:list():replace_at(5)
		end, { desc = "Replace buffer 5 from Harpoon" })
		vim.keymap.set("n", "<leader>q6", function()
			harpoon:list():replace_at(6)
		end, { desc = "Replace buffer 6 from Harpoon" })
		--
		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}
