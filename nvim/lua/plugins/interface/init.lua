local bufdelete = require('plugins.interface.bufdelete')
local bufferline = require('plugins.interface.bufferline')
local indent_blankline = require('plugins.interface.indent-blankline')
local lualine = require('plugins.interface.lualine')
local nvim_tree = require('plugins.interface.nvim-tree')
local toggleterm = require('plugins.interface.toggleterm')
local symbols_outline = require('plugins.interface.symbols-outline')

local interface_plugins = {}

interface_plugins.plugins = {
    -- bufferline
    -- 'kyazdani42/nvim-web-devicons',
    'akinsho/bufferline.nvim',
    -- indent line
    'lukas-reineke/indent-blankline.nvim',
    -- statusline
    'hoob3rt/lualine.nvim',
    -- start interface
    -- 'goolord/alpha-nvim',
    -- bottom terminal
    'akinsho/toggleterm.nvim',
    'famiu/bufdelete.nvim',
    'kyazdani42/nvim-tree.lua',
    'simrat39/symbols-outline.nvim',
}


function interface_plugins.load()
    bufferline.load()
    indent_blankline.load()
    lualine.load()
    nvim_tree.load()
    toggleterm.load()
    symbols_outline.load()
end

return interface_plugins
