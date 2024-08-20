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
      if not MiniFiles.close() then
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
