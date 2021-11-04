local theme_plugins = {}

theme_plugins.plugins = {
    'folke/tokyonight.nvim',
    'EdenEast/nightfox.nvim',
    'shaunsingh/nord.nvim',
    'projekt0n/github-nvim-theme'
}

function theme_plugins.load()
    vim.g.tokyonight_style = "storm"
    vim.cmd[[colorscheme tokyonight]]
    require('lualine').setup{options={theme='tokyonight'}}

    -- vim.cmd[[colorscheme nord]]
    -- require('lualine').setup{options={theme='nord'}}

    -- require('github-theme').setup({theme_style='dark_default'})

    -- require('nightfox').load('duskfox')
    -- require('lualine').setup{options={theme='nightfox'}}
end

return theme_plugins
