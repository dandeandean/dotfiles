return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			code = {
				sign = false,
				border = "thin",
				position = "right",
				width = "block",
				above = "▁",
				below = "▔",
				language_left = "█",
				language_right = "█",
				language_border = "▁",
				left_pad = 1,
				right_pad = 1,
			},
		})
	end,
}
