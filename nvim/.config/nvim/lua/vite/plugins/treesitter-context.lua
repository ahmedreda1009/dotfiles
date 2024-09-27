return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require 'treesitter-context'.setup {
      enable = true,   -- Enable context display
      separator = '',  -- This removes the horizontal line under the context
      throttle = true, -- Throttles performance for large files
      max_lines = 0,   -- Set to 0 to remove the underline
      patterns = {     -- Customize per-language patterns
        default = {
          'class', 'function', 'method'
        }
      },
    }

    vim.cmd([[
      highlight TreesitterContextBottom gui=NONE
      highlight TreesitterContextLineNumberBottom gui=NONE
    ]])
  end,

}
