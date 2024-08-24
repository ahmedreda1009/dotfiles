local map = vim.keymap.set
vim.g.mapleader = " "
-- gerneral
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
-- map("n", ";", ":", { desc = "command" })
-- map("i", "jf", "<ESC>")

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- window management
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Remove the <C-K> keybinding in Nvim
map('n', '<C-K>', '', { desc = 'Disable C-K' })

-- VimTmuxNavigator
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true, silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true, silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true, silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { noremap = true, silent = true })

-- theme switcher
-- map("n", "<leader>th", "<cmd>Themery<CR>", { desc = "Theme Switcher" })

-- auto-save toggle
map("n", "<leader>n", ":ASToggle<CR>", { desc = "Toggle Auto Save" })
