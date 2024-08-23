return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local MiniFiles = require('mini.files')
    MiniFiles.setup({
      sync_current_file = true,
      -- mappings = {
      --   go_in = 'L',
      --   go_in_plus = 'l',
      -- },
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


    ---- prevent the go out fn to go out of the entry directory
    local anchor_dir = ""
    local is_mini_files_explorer_open_event_triggered = false

    local function get_curr_dir()
      local curr_path = MiniFiles.get_fs_entry().path
      local curr_dir = vim.fs.dirname(curr_path)
      return curr_dir
    end
    -- get the entry directory path per session
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesExplorerOpen",
      callback = function()
        if not is_mini_files_explorer_open_event_triggered then
          anchor_dir = get_curr_dir()
          is_mini_files_explorer_open_event_triggered = true
        end
      end
    })
    -- Custom function to override go_out()
    local function custom_go_out()
      local current_dir = get_curr_dir()
      if current_dir == anchor_dir then
        print("Cannot navigate outside the initial directory.")
      else
        MiniFiles.go_out()
      end
    end
    -- Map the custom go_out function
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set('n', 'h', custom_go_out, { buffer = buf_id })
      end,
    })
  end,
}
