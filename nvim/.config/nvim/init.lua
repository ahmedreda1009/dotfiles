require("vite.core")
require("vite.lazy")
-- require("vite.theme")

-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFC900", bold = true })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffda7b", bold = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fab387", bold = true })

-- overriding the filetype detection in Neovim, treat typescriptreact as tsx etc...
vim.cmd [[
  au BufRead,BufNewFile *.tsx set filetype=tsx
  au BufRead,BufNewFile *.jsx set filetype=javascript
]]

-- vim.cmd [[
-- " WhichKey Customization (Catppuccin style with custom background)
-- highlight WhichKeyFloat guibg=#181726
-- highlight WhichKey guifg=#fab387  " Peach color for keys
-- highlight WhichKeyGroup guifg=#b4befe  " Lavender for groups
-- highlight WhichKeySeparator guifg=#f2d5cf  " Rosewater for separators
--
-- " mini.files Customization
-- highlight MiniFilesNormal guibg=#181726 guifg=#cba6f7  " Mauve for text
-- highlight MiniFilesBorder guifg=#b4befe guibg=#181726  " Lavender for borders
-- highlight MiniFilesDirectory guifg=#94e2d5  " Teal for directories
--
-- " Telescope Customization
-- highlight TelescopeNormal guibg=#181726 guifg=#f2d5cf  " Rosewater for text
-- highlight TelescopeBorder guifg=#b4befe guibg=#181726  " Lavender for borders
-- highlight TelescopePromptNormal guibg=#1f1d2e guifg=#ffffff  " Slightly different bg for prompt
-- highlight TelescopeSelection guibg=#282737 guifg=#f9e2af  " Yellow for selection
--
-- " Harpoon Customization
-- highlight HarpoonWindow guibg=#181726 guifg=#f2d5cf  " Rosewater for text
-- highlight HarpoonBorder guifg=#b4befe guibg=#181726  " Lavender for borders
-- highlight HarpoonFile guibg=#282737 guifg=#fab387  " Peach for selected files
-- ]]

-- tabnine config
require("tabnine").setup({
  disable_auto_comment = true,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 400,
  suggestion_color = { gui = "#808080", cterm = 244 },
  codelens_color = { gui = "#808080", cterm = 244 },
  codelens_enabled = true,
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to Tabnine log file,
})

-- automatically preserve fold state.
-- -- Create an augroup for AutoSaveFolds
-- local autosave_folds = vim.api.nvim_create_augroup("AutoSaveFolds", { clear = true })
-- -- Function to save the view if the buffer has a name
-- local function save_view()
-- 	if vim.fn.expand("%") ~= "" then
-- 		vim.cmd("mkview")
-- 	end
-- end
-- -- Function to load the view if the buffer has a name
-- local function load_view()
-- 	if vim.fn.expand("%") ~= "" then
-- 		vim.cmd("silent! loadview")
-- 	end
-- end
-- -- Autocommand to save folds when leaving a buffer
-- vim.api.nvim_create_autocmd("BufWinLeave", {
-- 	group = autosave_folds,
-- 	pattern = "*",
-- 	callback = save_view,
-- 	desc = "Save view with folds",
-- })
-- -- Autocommand to load folds when entering a buffer
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	group = autosave_folds,
-- 	pattern = "*",
-- 	callback = load_view,
-- 	desc = "Load view with folds",
-- })
