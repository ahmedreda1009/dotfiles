return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local MiniFiles = require('mini.files')

    -- Custom prefix: just the icon, coloring handled by highlights
    local my_prefix = function(fs_entry)
      if fs_entry.fs_type == 'directory' then
        return ' ' -- plain text icon
      end
      return MiniFiles.default_prefix(fs_entry)
    end

    MiniFiles.setup({
      sync_current_file = true,
      mappings = {
        go_in = 'L',
        go_in_plus = 'l',
      },
      windows = {
        preview = true,
        max_number = 5,
        -- -- width_preview = 50,
        -- -- Width of focused window
        -- width_focus = 35,
        -- -- -- Width of non-focused window
        -- width_nofocus = 10,
        -- -- -- Width of preview window
        -- width_preview = 70,
        width_focus = 50,
        width_nofocus = 20,
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
        config.border, config.title_pos = 'single', 'left'
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
        -- config.height = 1000
        -- config.width = 10
        -- config.width = vim.o.columns
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
        vim.keymap.set('n', "<cr>", "l", { buffer = buf_id, remap = true })
      end,
    })

    -- Make windows full height/width on open
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id
        local config = vim.api.nvim_win_get_config(win_id)
        config.height = vim.o.lines - 2
        config.width = vim.o.columns
        config.row = 0
        config.col = 0
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })

    -- Highlight groups
    vim.cmd([[
      " Focused
      highlight MiniFilesNormalFocused guibg=#1e1e1e guifg=#2DD4BF
      highlight MiniFilesBorderFocused guifg=#2DD4BF gui=bold
      highlight MiniFilesTitleFocused guifg=#2DD4BF guibg=#181825 gui=bold
      highlight MiniFilesDirectoryFocused guifg=#2DD4BF gui=bold
      highlight MiniFilesFileFocused guifg=#ffffff gui=bold
      highlight MiniFilesCursorLineFocused guibg=#3a3a3a gui=bold

      " Unfocused
      highlight MiniFilesNormalUnfocused guibg=#1a1a1a guifg=#a0a0a0
      highlight MiniFilesBorderUnfocused guifg=#555555
      highlight MiniFilesTitle guifg=#888888 guibg=#181825 gui=bold
      highlight MiniFilesDirectoryUnfocused guifg=#888888 gui=bold
      highlight MiniFilesFileUnfocused guifg=#888888 gui=bold
      highlight MiniFilesCursorLineUnfocused guibg=#2a2a2a gui=bold
    ]])

    -- Track focused window
    local focused_win = nil
    vim.api.nvim_create_autocmd('WinEnter', {
      callback = function()
        focused_win = vim.api.nvim_get_current_win()
      end
    })

    -- Update highlights dynamically
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowUpdate',
      callback = function(args)
        local win_id = args.data.win_id
        if win_id == focused_win then
          vim.api.nvim_win_set_option(win_id, "winhl",
            table.concat({
              "Normal:MiniFilesNormalFocused",
              "FloatBorder:MiniFilesBorderFocused",
              "MiniFilesTitle:MiniFilesTitleFocused",
              "MiniFilesDirectory:MiniFilesDirectoryFocused",
              "MiniFilesFile:MiniFilesFileFocused",
              "CursorLine:MiniFilesCursorLineFocused"
            }, ",")
          )
        else
          vim.api.nvim_win_set_option(win_id, "winhl",
            table.concat({
              "Normal:MiniFilesNormalUnfocused",
              "FloatBorder:MiniFilesBorderUnfocused",
              "MiniFilesTitle:MiniFilesTitle",
              "MiniFilesDirectory:MiniFilesDirectoryUnfocused",
              "MiniFilesFile:MiniFilesFileUnfocused",
              "CursorLine:MiniFilesCursorLineUnfocused"
            }, ",")
          )
        end
      end,
    })
  end
}
