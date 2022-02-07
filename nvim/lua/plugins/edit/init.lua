
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
    'ekickx/clipboard-image.nvim',
    -- dependencies
    'nvim-lua/plenary.nvim',
}

function edit_plugins.load()
    vim.g.kommentary_create_default_mappings = false
    require('kommentary.config').use_extended_mappings()

    require('nvim-autopairs').setup{}

    require("todo-comments").setup {}
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    require('telescope').setup{}

    require('clipboard-image').setup{
        markdown = {
            img_dir = function() return "/home/ch4ser/Documents/NOTES/.images/" .. vim.fn.expand('%:t:r') end,
            img_dir_txt = function() return vim.fn.expand('%:t:r') end,
            img_name = function() return os.date('%y-%m-%d-%H-%M-%S') end,
            affix = "![](/home/ch4ser/Documents/NOTES/.images/%s)"
        }
    }

end

return edit_plugins
