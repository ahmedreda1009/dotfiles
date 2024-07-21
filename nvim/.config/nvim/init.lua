require("vite.core")
require("vite.lazy")
-- require("vite.theme")

-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFC900", bold = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffda7b", bold = true })

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
