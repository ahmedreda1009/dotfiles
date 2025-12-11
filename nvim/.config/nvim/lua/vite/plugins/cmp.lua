return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			-- ========================
			-- Helpers
			-- ========================
			local function border(hl_name)
				return {
					{ "┏", hl_name },
					{ "━", hl_name },
					{ "┓", hl_name },
					{ "┃", hl_name },
					{ "┛", hl_name },
					{ "━", hl_name },
					{ "┗", hl_name },
					{ "┃", hl_name },
				}
			end

			local mocha = {
				base = "#1e1e2f",
				surface0 = "#313244",
				surface1 = "#45475a",
				surface2 = "#585b70",
				overlay0 = "#6c7086",
				overlay1 = "#7f849c",
				overlay2 = "#9399b2",
				text = "#cdd6f4",
				lavender = "#b4befe",
				flamingo = "#f2cdcd",
				yellow = "#f9e2af",
				red = "#f38ba8",
				green = "#2DD4BF",
				blue = "#89b4fa",
				pink = "#f5c2e7",
				peach = "#fab387",
			}

			-- ========================
			-- Highlights
			-- ========================
			local highlights = {
				{ "CmpSel", { bg = mocha.green, fg = "#16161E" } },
				{ "CmpPmenuBorder", { bg = mocha.base, fg = mocha.green } },
				{ "CmpDocBorder", { bg = mocha.base, fg = mocha.green } },
				{ "CmpBorder", { fg = mocha.green } },
				{ "mpDocBorder", { fg = mocha.green } },
			}

			for _, hl in ipairs(highlights) do
				vim.api.nvim_set_hl(0, hl[1], hl[2])
			end

			-- ========================
			-- CMP Setup
			-- ========================
			local cmp_ui = { icons = true, lspkind_text = true, style = "flat_dark" }

			cmp.setup({
				completion = { completeopt = "menu,menuone" },
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = border("CmpBorder"),
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
						scrollbar = true,
					},
					documentation = {
						border = border("mpDocBorder"),
						winhighlight = "Normal:CmpDoc",
					},
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(_, item)
						local icons = require("vite.configs.icons.lspkind")
						local icon = cmp_ui.icons and icons[item.kind] or ""
						if cmp_ui.style == "atom" or cmp_ui.style == "atom_colored" then
							icon = " " .. icon .. " "
							item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
							item.kind = icon
						else
							icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
							item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
						end
						return item
					end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-c>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
			})
		end,
	},
}
