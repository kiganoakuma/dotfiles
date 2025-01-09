return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- optional, but recommended
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- Basic Harpoon setup
			local harpoon = require("harpoon")
			harpoon.setup({
				-- Optional: default settings
				global_settings = {
					save_on_toggle = false,
					save_on_change = true,
					enter_on_sendcmd = false,
					tmux_autoclose_windows = false,
					excluded_filetypes = { "harpoon" },
					mark_branch = false,
				},
			})

			-- Key mappings
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			-- Navigation
			vim.keymap.set("n", "<LEADER>hh", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<LEADER>jj", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<LEADER>kk", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<LEADER>ll", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
