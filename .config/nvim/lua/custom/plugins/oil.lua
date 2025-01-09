return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup({
				float = {
					padding = 2,
					max_width = 120,
					max_height = 10,
					border = "rounded",
					win_options = {
						winblend = 10,
					},
				},
			})
			vim.keymap.set("n", "-", function()
				require("oil").open_float()
			end, { desc = "Open parent directory" })
		end,
	},
}
