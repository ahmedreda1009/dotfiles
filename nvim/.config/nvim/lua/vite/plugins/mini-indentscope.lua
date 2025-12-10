-- if true then
--   return {}
-- end
return {
  "echasnovski/mini.indentscope",
  version = false,
  event = "VeryLazy",  -- load lazily
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  init = function()
    -- Filetypes to disable
    local disabled_ft = {
      "Trouble","alpha","dashboard","fzf","help","lazy","mason",
      "neo-tree","notify","sidekick_terminal","snacks_dashboard",
      "snacks_notif","snacks_terminal","snacks_win","toggleterm",
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        if vim.tbl_contains(disabled_ft, vim.bo.filetype) then
          vim.b.miniindentscope_disable = true
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function(data)
        vim.b[data.buf].miniindentscope_disable = true
      end,
    })
  end,
}
