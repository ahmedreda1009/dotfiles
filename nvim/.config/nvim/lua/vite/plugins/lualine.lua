return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local my_custom_theme = {
      normal = {
        a = { bg = "#02f1f5", fg = "#1a1b26", gui = "bold" }, -- vibrant blue
        -- a = { bg = "#7aa2f7", fg = "#1a1b26", gui = "bold" }, -- vibrant blue
        b = { bg = "#474747", fg = "#ffffff", gui = "bold" }, -- darker gray
        c = { bg = "#1a1b26", fg = "#ffffff", gui = "bold" }, -- light gray
        z = { bg = "#02f1f5", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
      insert = {
        a = { bg = "#a9ff68", fg = "#1a1b26", gui = "bold" }, -- vibrant gray
        b = { bg = "#474747", fg = "#ffffff", gui = "bold" }, -- darker gray
        c = { bg = "#1a1b26", fg = "#ffffff", gui = "bold" }, -- light gray
        z = { bg = "#a9ff68", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
      visual = {
        a = { bg = "#ff61ef", fg = "#1a1b26", gui = "bold" }, -- vibrant purple
        b = { bg = "#474747", fg = "#ffffff", gui = "bold" }, -- darker gray
        c = { bg = "#1a1b26", fg = "#ffffff", gui = "bold" }, -- light gray
        z = { bg = "#ff61ef", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
      command = {
        a = { bg = "#ffda7b", fg = "#1a1b26", gui = "bold" }, -- vibrant yellow
        b = { bg = "#474747", fg = "#ffffff", gui = "bold" }, -- darker gray
        c = { bg = "#1a1b26", fg = "#ffffff", gui = "bold" }, -- light gray
        z = { bg = "#ffda7b", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
      replace = {
        a = { bg = "#ff5555", fg = "#1a1b26", gui = "bold" }, -- vibrant red
        b = { bg = "#474747", fg = "#ffffff", gui = "bold" }, -- darker gray
        c = { bg = "#1a1b26", fg = "#ffffff", gui = "bold" }, -- light gray
        z = { bg = "#ff5555", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
      inactive = {
        a = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- gray
        b = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- light gray
        c = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- light gray
        z = { bg = "#474747", fg = "#1a1b26", gui = "bold" }, -- light gray
      },
    }

    local function getVimIcon()
      local mode = vim.fn.mode()
      local mode_names = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        [""] = "VISUAL BLOCK",
        V = "VISUAL LINE",
        c = "COMMAND-LINE",
        R = "REPLACE",
        t = "TERMINAL-JOB",
        ["!"] = "SHELL",
      }
      local mode_name = mode_names[mode]
      -- return " " .. mode_name
      return mode_name
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = my_custom_theme,
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "|", right = "|" },
        -- component_separators = { left = "┃", right = "┃", },
        component_separators = { left = "", right = "", },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "█", right = "█" },
        -- section_separators = { left = "█", right = "█" },
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { {
          function() return ' ' end,
          padding = { left = 0, right = 0 }
        } },
        lualine_c = {
          {
            "harpoon2",
            icon = ' ',
            -- indicators = { "1", "2", "3", "4", "5", "6" },
            -- active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]" },
            -- indicators = { "󰎦", "󰎩", "󰎬", "󰎮", "󰎰", "󰎵", "󰎸", "󰎻", "󰎾", "󰽾" },
            -- active_indicators = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳", "󰎶", "󰎹", "󰎼", "󰽽" },
            indicators = { "󰲡", "󰲣", "󰲥", "󰲧", "󰲩", "󰲫", "󰲭", "󰲯", "󰲱", "󰿭" },
            active_indicators = { "󰲠", "󰲢", "󰲤", "󰲦", "󰲨", "󰲪", "󰲬", "󰲮", "󰲰", "󰿬" },
            _separator = "",
            no_harpoon = "󰎡",
          },
        },
        lualine_x = { "diff", "diagnostics", "lsp_progress", "filetype", "location", "progress",
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          }
        },
        -- lualine_x = { "tabnine", "diff", "diagnostics", "lsp_progress", "filename", },
        lualine_y = { {
          function() return ' ' end,
          padding = { left = 0, right = 0 }
        }, },
        lualine_z = { "branch" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
