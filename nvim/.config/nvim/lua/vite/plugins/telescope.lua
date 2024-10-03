return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            'fd', '--type', 'f', '--hidden', '--follow', '--no-ignore'
          },
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          -- sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              -- prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.5,
            },
            vertical = {
              mirror = false,
            },
            -- width = 0.87,
            -- height = 0.80,
            -- preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
              ["x"] = require("telescope.actions").delete_buffer,
            },
            i = {
              ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
              ["<C-j>"] = require("telescope.actions").move_selection_next,     -- move to next result
              -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
              -- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
            },
          },
        },
        pickers = {
          buffers = {
            initial_mode = "normal",      -- Set initial_mode to normal for buffers search
            prompt_title = " Buffers",
            sort_mru = true,              -- Sort by most recently used
            ignore_current_buffer = true, -- Ignore the current buffer in the listing
            sorter = require('telescope.sorters').get_substr_matcher(),
          },
          find_files = {
            -- theme = "dropdown",
            prompt_title = "󰩉 Find Files",
          },
          grep_string = {
            initial_mode = "normal", -- Set initial_mode to normal for
            prompt_title = "Word Under Cursor",
          }
        },
      })

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')

      require("telescope").load_extension("notify")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        require('mini.files').close()
        builtin.find_files({
          find_command = { 'rg', '--files', '--hidden' }
        })
      end, { desc = "[f]ind files" })
      vim.keymap.set("n", "<leader>fg", function()
        require('mini.files').close()
        builtin.live_grep()
      end, { desc = "[l]ive grep" })
      vim.keymap.set("n", "<leader><leader>", function()
        require('mini.files').close()
        builtin.buffers()
      end, { desc = "[b]uffers search" })
      vim.keymap.set("n", "<leader>fh", function()
        require('mini.files').close()
        builtin.help_tags()
      end, { desc = "[h]elp tags" })
      vim.keymap.set("n", "<leader>fw", function()
        require('mini.files').close()
        builtin.grep_string()
      end, { desc = "[w]ord find" })
      vim.keymap.set("n", "<leader>ft", function()
        require('mini.files').close()
        vim.api.nvim_command("TodoTelescope")
      end, { desc = "Find todos" })

      vim.cmd([[
  highlight TelescopeBorder guifg=#A6ADC8 guibg=#181726
  highlight TelescopePromptBorder guifg=#A6ADC8 guibg=#303041
  highlight TelescopeResultsBorder guifg=#A6ADC8 guibg=#181726
  highlight TelescopePreviewBorder guifg=#A6ADC8 guibg=#181726
  highlight TelescopePreviewTitle guibg=#F5C2E7 guifg=#181726
  highlight TelescopePreviewNormal guibg=#181726 guifg=#C3BAC6
  "highlight TelescopePromptNormal guifg=#F5C2E7 guibg=#303041
  highlight TelescopePromptNormal guifg=#F8BD96 guibg=#303041
  highlight TelescopePromptPrefix guifg=#F8BD96 guibg=#303041
  highlight TelescopeNormal guifg=#C3BAC6 guibg=#181726
  highlight TelescopePromptTitle guibg=#F8BD96 guifg=#181726
  highlight TelescopeResultsTitle guibg=#7aa2f7 guifg=#181726
  highlight TelescopeResultsNormal guibg=#181726 guifg=#C3BAC6
  highlight TelescopeSelection guifg=#F8BD96 guibg=#303041
  highlight TelescopeMatching guifg=#F8BD96 guibg=#181726
]])
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
              border = {},
              -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
              borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
              initial_mode = "normal"
            }),

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },
}
