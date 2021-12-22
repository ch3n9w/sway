
local edit_plugins = {}

edit_plugins.plugins = {
    -- comment tool
    'b3nj5m1n/kommentary',
    'folke/todo-comments.nvim',
    -- autopair
    'windwp/nvim-autopairs',
    -- easymotion
    'phaazon/hop.nvim',
    'yamatsum/nvim-cursorline',
    'nvim-telescope/telescope.nvim',
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

end

return edit_plugins
