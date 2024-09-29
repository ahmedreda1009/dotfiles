return {
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = function(_, opts)
  --     opts.transparent = true
  --     opts.italic_comments = true
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "cyberdream",
  --   },
  -- },
  --
  -- -- modicator (auto color line number based on vim mode)
  -- {
  --   "mawkler/modicator.nvim",
  --   dependencies = "scottmckendry/cyberdream.nvim",
  --   init = function()
  --     -- These are required for Modicator to work
  --     vim.o.cursorline = false
  --     vim.o.number = true
  --     vim.o.termguicolors = true
  --   end,
  --   opts = {},
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       -- style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --       -- light_style = "day", -- The theme is used when the background is set to light
  --       transparent = false,    -- Enable this to disable setting the background color
  --       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = "transparent",       -- style for sidebars, see below
  --         floats = "dark",                -- style for floating windows
  --       },
  --       sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --       day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --       hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --       dim_inactive = false,             -- dims inactive windows
  --       lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = false,
  --         treesitter = true,
  --         notify = false,
  --         alpha = true,
  --         aerial = true,
  --         dap = true,
  --         dap_ui = true,
  --         mason = true,
  --         neotree = true,
  --         -- notify = true,
  --         -- nvimtree = false,
  --         semantic_tokens = true,
  --         symbols_outline = true,
  --         telescope = true,
  --         ts_rainbow = false,
  --         which_key = true,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = "",
  --         },
  --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --       },
  --     })
  --     vim.cmd("colorscheme tokyonight")
  --     -- vim.cmd.colorscheme("tokyonight-night")
  --
  --     -- You can configure highlights by doing something like:
  --     -- vim.cmd.hi("Comment gui=none")
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,

    config = function()
      require("catppuccin").setup({
        -- flavour = "mocha", -- latte, frappe, macchiato, mocha
        -- background = {     -- :h background
        --   light = "latte",
        --   dark = "mocha",
        -- },
        -- transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,          -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,        -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,          -- Force no italic
        no_bold = false,            -- Force no bold
        no_underline = false,       -- Force no underline
        styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },  -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {
          all = {
            base = "#181825",
            mantle = "#1e1e2e",
            -- return {
            -- 	rosewater = "#f5e0dc",
            -- 	flamingo = "#f2cdcd",
            -- 	pink = "#f5c2e7",
            -- 	mauve = "#cba6f7",
            -- 	red = "#f38ba8",
            -- 	maroon = "#eba0ac",
            -- 	peach = "#fab387",
            -- 	yellow = "#f9e2af",
            -- 	green = "#a6e3a1",
            -- 	teal = "#94e2d5",
            -- 	sky = "#89dceb",
            -- 	sapphire = "#74c7ec",
            -- 	blue = "#89b4fa",
            -- 	lavender = "#b4befe",
            -- 	text = "#cdd6f4",
            -- 	subtext1 = "#bac2de",
            -- 	subtext0 = "#a6adc8",
            -- 	overlay2 = "#9399b2",
            -- 	overlay1 = "#7f849c",
            -- 	overlay0 = "#6c7086",
            -- 	surface2 = "#585b70",
            -- 	surface1 = "#45475a",
            -- 	surface0 = "#313244",
            -- 	base = "#1e1e2e",
            -- 	mantle = "#181825",
            -- 	crust = "#11111b",
            -- }
          }
        },
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = false,
          treesitter = true,
          notify = true,
          alpha = true,
          aerial = true,
          dap = true,
          dap_ui = true,
          mason = true,
          neotree = true,
          semantic_tokens = true,
          symbols_outline = true,
          telescope = true,
          ts_rainbow = false,
          which_key = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- {
  --   "tiagovla/tokyodark.nvim",
  --   opts = {
  --     -- custom options here
  --     integrations = {
  --       cmp = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup({
  --
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = false,
  --         treesitter = true,
  --         notify = false,
  --         alpha = true,
  --         aerial = true,
  --         dap = true,
  --         dap_ui = true,
  --         mason = true,
  --         neotree = true,
  --         -- notify = true,
  --         -- nvimtree = false,
  --         semantic_tokens = true,
  --         symbols_outline = true,
  --         telescope = true,
  --         ts_rainbow = false,
  --         which_key = true,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = "",
  --         },
  --       },
  --     }) -- calling setup is optional
  --     vim.cmd([[colorscheme tokyodark]])
  --   end,
  -- },
  --
  -- {
  --   "barrientosvctor/abyss.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd([[colorscheme abyss]])
  --   end
  -- },
  --
  -- {
  --   "Shatur/neovim-ayu",
  --   config = function()
  --     require("ayu").setup({})
  --
  --     vim.cmd("colorscheme ayu")
  --   end,
  -- },
  --
  -- {
  --   "projekt0n/github-nvim-theme",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       -- ...
  --     })
  --
  --     vim.cmd("colorscheme github_dark_default")
  --   end,
  -- },
  --
  -- {
  --   "xStormyy/bearded-theme.nvim",
  --   config = function()
  --     vim.cmd("colorscheme bearded-theme")
  --   end,
  -- },
  --
  -- {
  --   { "yashguptaz/calvera-dark.nvim" },
  --   {
  --     "LazyVim/LazyVim",
  --     -- opts = {
  --     --   colorscheme = "calvera",
  --     -- },
  --
  --     config = function()
  --       -- vim.cmd("colorscheme calvera")
  --     end,
  --   },
  -- }
}
