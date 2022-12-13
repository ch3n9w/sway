local telescope = require('plugins.finder.telescope')

local finder_plugins = {}

finder_plugins.plugins = {
    'nvim-telescope/telescope.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
}

function finder_plugins.load()
    telescope.load()
end

return finder_plugins
