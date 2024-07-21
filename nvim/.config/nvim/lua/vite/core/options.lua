local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

o.clipboard = "unnamedplus"
o.showmode = false
o.cursorline = true
o.wrap = false
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.updatetime = 250
o.numberwidth = 4
o.shiftwidth = 2
o.mouse = "a"

opt.number = true
opt.relativenumber = true
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.termguicolors = true
opt.swapfile = false
opt.scrolloff = 10
opt.undofile = true
opt.splitright = true   -- split vertical window to the right
opt.splitbelow = true   -- split horizontal window to the bottom
opt.ignorecase = true   -- ignore case when searching
opt.smartcase = true    -- if you include mixed case in your search, assumes you want case-sensitive
opt.fillchars = { eob = " " }
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start"
-- opt.guicursor = {
-- 	"n-v-c:block", -- Normal, visual, command-line: block cursor
-- 	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
-- 	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
-- 	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
-- 	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
-- 	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
