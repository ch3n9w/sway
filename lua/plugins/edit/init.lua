
local edit_plugins = {}

edit_plugins.plugins = {
    -- comment tool
    'b3nj5m1n/kommentary',
    -- autopair
    'windwp/nvim-autopairs',
    'nvim-lua/plenary.nvim',
    'folke/todo-comments.nvim',
    -- HACK: easymotion
    'phaazon/hop.nvim',
    'yamatsum/nvim-cursorline',
    'nvim-telescope/telescope.nvim'
}


function edit_plugins.load()
    require('nvim-autopairs').setup{}

    require("todo-comments").setup {}
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    require('telescope').setup{}
end

return edit_plugins