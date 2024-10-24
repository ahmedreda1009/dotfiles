return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local MiniFiles = require('mini.files')

    local my_prefix = function(fs_entry)
      if fs_entry.fs_type == 'directory' then
        -- NOTE: it is usually a good idea to use icon followed by space
        return ' ', 'MiniFilesDirectory'
      end
      return MiniFiles.default_prefix(fs_entry)
    end

    MiniFiles.setup({
      sync_current_file = true,
      -- mappings = {
      --   go_in = 'L',
      --   go_in_plus = 'l',
      -- },
      windows = {
        preview = true,
        width_preview = 50,
      },
      content = { prefix = my_prefix },
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

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id

        -- Customize window-local settings
        vim.wo[win_id].winblend = 0
        local config = vim.api.nvim_win_get_config(win_id)
        config.border, config.title_pos = 'double', 'left'
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })

    -- Key mapping to toggle mini.files
    vim.keymap.set('n', 'f', minifiles_toggle, { noremap = true, silent = true, desc = 'Toggle mini files' })

    -- add padding to titles
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowUpdate',
      callback = function(args)
        local config = vim.api.nvim_win_get_config(args.data.win_id)

        -- Ensure fixed height
        -- config.height = 10

        -- Ensure title padding
        if config.title[#config.title][1] ~= ' ' then
          table.insert(config.title, { ' ', 'NormalFloat' })
        end
        if config.title[1][1] ~= ' ' then
          table.insert(config.title, 1, { ' ', 'NormalFloat' })
        end

        vim.api.nvim_win_set_config(args.data.win_id, config)
      end,
    })

    -- highlight groups
    -- vim.cmd([[
    --   highlight MiniFilesTitleFocused guibg=#fab387 guifg=#222222
    --   highlight MiniFilesBorderModified guifg=#ff0000
    --   highlight MiniFilesNormal guibg=#1e1e2f
    -- ]])
    vim.cmd([[
      highlight MiniFilesTitleFocused guibg=#2DD4BF guifg=#181825 gui=bold
      "highlight MiniFilesTitleFocused guibg=#F2D8A7 guifg=#181825 gui=bold
      highlight MiniFilesTitle guifg=#2DD4BF gui=bold
      "highlight MiniFilesTitle guibg=#F5C2E7 guifg=#181825 gui=bold
      highlight MiniFilesBorder guifg=#2DD4BF
      highlight MiniFilesBorderModified guifg=#F38BA8
      highlight MiniFilesCursorLine guibg=#2DD4BF guifg=#181825
      "highlight MiniFilesDirectory guifg=#2DD4BF gui=bold
      highlight MiniFilesDirectory guifg=#ffffff gui=bold
      "highlight MiniFilesFile guibg=#181825 guifg=#C3BAC6
      "highlight MiniFilesNormal guibg=#181825 guifg=#F8BD96
      highlight MiniFilesNormal guibg=#181825
    ]])

    -- * `MiniFilesBorder` - border of regular windows.
    -- * `MiniFilesBorderModified` - border of windows showing modified buffer.
    -- * `MiniFilesCursorLine` - cursor line in explorer windows.
    -- * `MiniFilesDirectory` - text and icon representing directory.
    -- * `MiniFilesFile` - text representing file.
    -- * `MiniFilesNormal` - basic foreground/background highlighting.
    -- * `MiniFilesTitle` - title of regular windows.
    -- * `MiniFilesTitleFocused` - title of focused window.

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
        vim.keymap.set('n', "<Esc>", MiniFiles.close, { buffer = buf_id })
      end,
    })
  end,
}
