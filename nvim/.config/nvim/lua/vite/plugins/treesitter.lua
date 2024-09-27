return {
  -- { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true, -- Keep Tree-sitter highlighting
          additional_vim_regex_highlighting = false,
        },
        -- additional_vim_regex_highlighting = { "html" },
        -- enable indentation
        -- indent = { enable = true, disable = { "html" } },
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        -- autotag = {
        -- 	enable = true,
        -- },
        -- Autoinstall languages that are not installed
        auto_install = true,
        -- ensure these language parsers are installed
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false, -- Prevents the line from showing up
        },
      })

      vim.cmd([[
        highlight! link @variable ScopeHighlight
        highlight! clear TreesitterContext
      ]])

      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true,          -- Auto close tags
          enable_rename = true,         -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = true,
          },
        },
      })
    end,
  } }
