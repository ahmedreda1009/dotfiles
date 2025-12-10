return {
  "echasnovski/mini.map",
  version = false,
  config = function()
    local MiniMap = require("mini.map")

    MiniMap.setup({
      symbols = {
        -- VS Code–like density
        encode = MiniMap.gen_encode_symbols.dot("4x2"),
        -- encode = MiniMap.gen_encode_symbols.block("2x1")
      },

      window = {
        width = 15,
        winblend = 0,
        show_integration_count = false,
        side = "right",
        focusable = false,
      },

      integrations = {
        MiniMap.gen_integration.builtin_search(),
        MiniMap.gen_integration.diagnostic(),
        MiniMap.gen_integration.diff(),
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>mm", MiniMap.toggle, { desc = "MiniMap Toggle" })
    vim.keymap.set("n", "<leader>mo", MiniMap.open, { desc = "MiniMap Open" })
    vim.keymap.set("n", "<leader>mc", MiniMap.close, { desc = "MiniMap Close" })
    vim.keymap.set("n", "<leader>mf", MiniMap.refresh, { desc = "MiniMap Refresh" })

    ----------------------------------------------------------------
    -- 🎨 FIX WHITE MINIMAP (Better VSCode-like gray shading)
    ----------------------------------------------------------------
    vim.api.nvim_set_hl(0, "MiniMapNormal", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "MiniMapSymbolCount", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#00cca4", bold = true })

    ----------------------------------------------------------------
    -- Optional: Auto-open minimap when entering a file buffer
    ----------------------------------------------------------------
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local exclude = {
          "help",
          "lazy",
          "mason",
          "dashboard",
          "neo-tree",
          "mini.files",
          "alpha",
          "gitcommit",
        }

        if vim.tbl_contains(exclude, vim.bo.filetype) then
          return
        end

        MiniMap.open()
      end,
    })
  end,
}
