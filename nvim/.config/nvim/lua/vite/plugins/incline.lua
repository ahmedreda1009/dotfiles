-- filename
return
{
  "b0o/incline.nvim",
  dependencies = { "craftzdog/solarized-osaka.nvim" },
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local colors = require("solarized-osaka.colors").setup()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#d23781", guifg = "#1e1e2f" },
          InclineNormalNC = { guifg = "#5b6891", guibg = "#1a1b26" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 0 } },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}