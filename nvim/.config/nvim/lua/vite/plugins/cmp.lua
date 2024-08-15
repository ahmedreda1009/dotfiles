return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
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
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path",   -- source for file system paths
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp_ui = {
        icons = true,
        lspkind_text = true,
        style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
      }
      local cmp_style = cmp_ui.style

      local formatting_style = {
        -- default fields order i.e completion word + item.kind + item.kind icons
        fields = { "abbr", "kind", "menu" },

        format = function(_, item)
          local icons = require("vite.configs.icons.lspkind")
          local icon = (cmp_ui.icons and icons[item.kind]) or ""

          if cmp_style == "atom" or cmp_style == "atom_colored" then
            icon = " " .. icon .. " "
            item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
            item.kind = icon
          else
            icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
            item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
          end

          return item
        end,
      }
      cmp.setup({
        completion = {
          completeopt = "menu,menuone",
        },

        window = {
          completion = {
            border = {
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
              { " ", "CmpPmenuBorder" },
            },
            -- side_padding = 1,
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
            scrollbar = true,
          },
          documentation = {
            border = {
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
              { " ", "CmpDocBorder" },
            },
            -- side_padding = 1,
            winhighlight = "Normal:CmpDoc",
          },
        },
        formatting = formatting_style,
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        },
        sources = {
          { name = "vsnip",   priority = 1000 },
          { name = "luasnip" }, -- For luasnip users.
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },

        -- formatting = {
        --   format = function(entry, vim_item)
        --     vim_item.kind = string.format("%s %s", vim_item.kind, entry.source.name)
        --     return vim_item
        --   end,
        --   fields = { "kind", "abbr", "menu" },
        -- },
      })

      -- Set highlight for the selected item background to vibrant green
      -- vim.api.nvim_set_hl(0, "CmpSel", { bg = "#7AA2F7", fg = "#16161E" })
      vim.api.nvim_set_hl(0, "CmpSel", { bg = "#fab387", fg = "#16161E" })
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#16161E" })
      vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#282A36" })
      vim.api.nvim_set_hl(0, "CmpPmenuBorder", { bg = "#16161E" })
      vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#282A36" })
    end,
  },
}
