local kommentary = require('plugins.edit.kommentary')
local nvim_autopairs = require('plugins.edit.nvim-autopairs')
local marks = require('plugins.edit.marks')
local tabout = require('plugins.edit.tabout')
local todo_comment = require('plugins.edit.todo-comments')
local surround = require('plugins.edit.surround')

local edit_plugins = {}

edit_plugins.plugins = {
    -- comment tool
    'b3nj5m1n/kommentary',
    'folke/todo-comments.nvim',
    -- autopair
    'windwp/nvim-autopairs',
    -- paste image from clipboard
    -- 'ekickx/clipboard-image.nvim',
    -- 'askfiy/nvim-picgo',
    -- tabout
    'abecodes/tabout.nvim',
    'chentoast/marks.nvim',
    'kylechui/nvim-surround',

}

function edit_plugins.load()
    kommentary.load()
    nvim_autopairs.load()
    todo_comment.load()
    tabout.load()
    marks.load()
    surround.load()

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
