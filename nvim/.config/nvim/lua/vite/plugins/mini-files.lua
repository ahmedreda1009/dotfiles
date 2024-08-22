return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local MiniFiles = require('mini.files')
    MiniFiles.setup({
      sync_current_file = true,
    })

    -- Function to toggle mini.files
    local minifiles_toggle = function()
      local harpoon = require("harpoon")

      if not MiniFiles.close() then
        local current_path = vim.api.nvim_buf_get_name(0)

        -- if the harpoon is opened then close it first
        if string.match(current_path, "__harpoon%-menu__") then
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end

        -- Continue with the rest of your code here
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
        -- Prepend branch with parent paths until current working directory is reached
        MiniFiles.reveal_cwd()
      end
    end

    -- Key mapping to toggle mini.files
    vim.keymap.set('n', ';', minifiles_toggle, { noremap = true, silent = true, desc = 'Toggle mini files' })

    -- highlight groups
    vim.cmd([[
      highlight MiniFilesTitleFocused guifg=#fab387
    ]])
  end,
}
