local vim = vim

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.errorbells = false
vim.o.mouse = 'a'

vim.o.modifiable = true
-- the refresh time will affect lspsaga's reaction time
vim.o.updatetime = 300
-- case setting
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.cursorline = true

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

-- visual selection mode
vim.o.sel='inclusive'

-- set tab to 4 spaces, could be override by ftplugin
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- show numbers
vim.o.number = true
-- vim.o.relativenumber = true

-- save space for window
vim.o.signcolumn = 'yes'

-- wrap line when too long to display
vim.o.wrap = true

-- key mappings
vim.g.mapleader = ' '

-- load preview view
vim.o.viewoptions='folds,cursor,curdir'

-- setting for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- neovide setting
vim.o.guifont = 'Hack Nerd Font:h20'
-- vim.o.guifont = 'Hack:h20'
vim.g.neovide_transparency = 1
vim.g.neovide_cursor_vfx_mode = "wireframe"
-- adjust this to disable animation
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_trail_size = 0

