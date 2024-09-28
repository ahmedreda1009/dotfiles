-- filename
return {
  "b0o/incline.nvim",
  dependencies = {},
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local helpers = require("incline.helpers")
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guifg = "#ffffff" },
          InclineNormalNC = { guifg = "#5b6891" },
        },
      },
      window = {
        padding = 0,
        margin = { horizontal = 0 },
        zindex = 100
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local buffer = {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
          or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          guibg = "#363944",
        }
        return buffer
      end,
    })
  end,
}
