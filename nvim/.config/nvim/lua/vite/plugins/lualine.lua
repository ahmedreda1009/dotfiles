return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local my_custom_theme = {
      normal = {
        a = { bg = "#7aa2f7", fg = "#1a1b26", gui = "bold" }, -- Vibrant blue
        b = { bg = "#2a2f41", fg = "#FFFFFF", gui = "bold" }, -- Darker gray
        c = { bg = "#1a1b26", fg = "#FFFFFF", gui = "bold" }, -- Light gray
      },
      insert = {
        a = { bg = "#98C379", fg = "#1a1b26", gui = "bold" }, -- Vibrant gray
        b = { bg = "#2a2f41", fg = "#FFFFFF", gui = "bold" }, -- Darker gray
        c = { bg = "#1a1b26", fg = "#FFFFFF", gui = "bold" }, -- Light gray
      },
      visual = {
        a = { bg = "#FF61EF", fg = "#1a1b26", gui = "bold" }, -- Vibrant purple
        b = { bg = "#2a2f41", fg = "#FFFFFF", gui = "bold" }, -- Darker gray
        c = { bg = "#1a1b26", fg = "#FFFFFF", gui = "bold" }, -- Light gray
      },
      command = {
        a = { bg = "#FFDA7B", fg = "#1a1b26", gui = "bold" }, -- Vibrant yellow
        b = { bg = "#2a2f41", fg = "#FFFFFF", gui = "bold" }, -- Darker gray
        c = { bg = "#1a1b26", fg = "#FFFFFF", gui = "bold" }, -- Light gray
      },
      replace = {
        a = { bg = "#FF5555", fg = "#1a1b26", gui = "bold" }, -- Vibrant red
        b = { bg = "#2a2f41", fg = "#FFFFFF", gui = "bold" }, -- Darker gray
        c = { bg = "#1a1b26", fg = "#FFFFFF", gui = "bold" }, -- Light gray
      },
      inactive = {
        a = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- gray
        b = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- light gray
        c = { bg = "#44475a", fg = "#6272a4", gui = "bold" }, -- light gray
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
        component_separators = { left = "┃", right = "┃", },
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "█", right = "█" },
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
        lualine_b = { "branch" },
        lualine_c = { {
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
        }, "filename", "diff", "diagnostics", "lsp_progress"
        },
        lualine_x = { "tabnine", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
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
