local theme_plugins = {}

theme_plugins.plugins = {
    --[[ 'folke/tokyonight.nvim',
    'projekt0n/github-nvim-theme', ]]
    'ishan9299/nvim-solarized-lua'
}

function theme_plugins.load()
    -- vim.g.tokyonight_style = "storm"
    -- vim.cmd[[colorscheme tokyonight]]
    vim.cmd[[colorscheme solarized-flat]]
    -- require('lualine').setup{options={theme='tokyonight'}}
    require('lualine').setup{}


    -- require('github-theme').setup({theme_style='dark_default'})

end

return theme_plugins
