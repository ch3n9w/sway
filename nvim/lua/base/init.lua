local vim = vim
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.mouse = 'a'
vim.o.modifiable = true
-- the refresh time will affect lspsaga's reaction time
-- vim.o.updatetime = 300
-- case setting
vim.o.smartcase = true
vim.o.ignorecase = true
-- vim.o.cursorline = true

-- clipboard
vim.o.clipboard = 'unnamedplus'


-- folder view setting
vim.o.foldmethod='indent'
vim.o.foldlevel=99


vim.o.scrolloff=0

-- indent setting
vim.o.autoindent = true
vim.o.smartindent = true

-- no additional files
vim.o.swapfile = false
vim.o.backup = false -- insert mode compeleting menu setting
vim.o.completeopt='menuone,noinsert,noselect'

-- set tab to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- show numbers
vim.o.number = true
-- always show signcolumn
vim.o.signcolumn = 'yes'

-- wrap line when too long to display
vim.o.wrap = true

-- key mappings
vim.g.mapleader = ' '

-- load preview view
vim.o.viewoptions='folds,cursor,curdir'
vim.cmd('autocmd BufLeave * silent! mkview')
-- vim.cmd('autocmd BufWinEnter * silent! loadview')
-- vim.cmd('autocmd WinEnter * silent! loadview')
vim.cmd('autocmd BufEnter * silent! loadview')

-- fcitx5
vim.cmd('autocmd InsertLeave * :silent !fcitx5-remote -c')
vim.cmd('autocmd BufCreate *  :silent !fcitx5-remote -c')
vim.cmd('autocmd BufEnter *  :silent !fcitx5-remote -c ')
vim.cmd('autocmd BufLeave *  :silent !fcitx5-remote -c ')
