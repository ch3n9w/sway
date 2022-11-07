local hop = require('plugins.edit.hop')
local kommentary = require('plugins.edit.kommentary')
local nvim_autopairs = require('plugins.edit.nvim-autopairs')
-- local tabout = require('plugins.edit.tabout')
local telescope = require('plugins.edit.telescope')
local todo_comment = require('plugins.edit.todo-comments')

local edit_plugins = {}

edit_plugins.plugins = {
    -- comment tool
    'b3nj5m1n/kommentary',
    'folke/todo-comments.nvim',
    -- autopair
    'windwp/nvim-autopairs',
    -- easymotion
    'phaazon/hop.nvim',
    'nvim-telescope/telescope.nvim',
    -- paste image from clipboard
    -- 'ekickx/clipboard-image.nvim',
    -- 'askfiy/nvim-picgo',
    -- dependencies
    'nvim-lua/plenary.nvim',
}

function edit_plugins.load()
    hop.load()
    kommentary.load()
    nvim_autopairs.load()
    telescope.load()
    todo_comment.load()

    --[[ require('clipboard-image').setup{
        markdown = {
            img_dir = function() return "/home/ch4ser/Documents/NOTES/.images/" .. vim.fn.expand('%:t:r') end,
            -- img_dir = function() return "./images/" .. vim.fn.expand('%:t:r') end,
            img_dir_txt = function() return vim.fn.expand('%:t:r') end,
            img_name = function() return os.date('%y-%m-%d-%H-%M-%S') end,
            affix = "![](~/Documents/NOTES/.images/%s)"
        }
    } ]]
    --[[ require("nvim-picgo").setup{
        notice = "echo",
    } ]]

end

return edit_plugins
