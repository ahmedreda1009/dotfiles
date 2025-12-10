if true then
  return {}
end
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = "│",
      -- tab_char = "│",
      highlight = "IblIndent"
      -- char = "┃",
      -- tab_char = "┃",
      -- char = "▍",
      -- tab_char = "▍",
      -- char = "▌",
      -- tab_char = "▌",
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "nvim-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}


-- Default: `▎` ~
--
-- Alternatives: ~
--  • left aligned solid
--    • `▏`
--    • `▎` (default)
--    • `▍`
--    • `▌`
--    • `▋`
--    • `▊`
--    • `▉`
--    • `█`
--  • center aligned solid
--    • `│`
--    • `┃`
--  • right aligned solid
--    • `▕`
--    • `▐`
--  • center aligned dashed
--    • `╎`
--    • `╏`
--    • `┆`
--    • `┇`
--    • `┊`
--    • `┋`
--  • center aligned double
--    • `║`
