return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				js = {
					icon = "",
					color = "#f1e05a",
					cterm_color = "185",
					name = "Js",
				},
				ts = {
					icon = "",
					color = "#2F74C0",
					cterm_color = "185",
					name = "Ts",
				},
				norg = {
					icon = "󰈙",
					color = "#e34c26",
					cterm_color = "185",
					name = "Norg",
				},
				-- html = {
				--     icon = "",
				--     color = "#e34c26",
				--     cterm_color = "166",
				--     name = "Html"
				-- },
				-- css = {
				--     icon = "",
				--     color = "#563d7c",
				--     cterm_color = "61",
				--     name = "Css"
				-- },
				-- md = {
				--     icon = "",
				--     color = "#519aba",
				--     cterm_color = "67",
				--     name = "Markdown"
				-- },
				-- ["package.json"] = {
				--   icon = "",
				--
				--     color = "#519aba",
				--     cterm_color = "67",
				--     name = "Markdown"
				-- }
			},
			default = true,
			default_icon_size = 44,
		})
	end,
}
