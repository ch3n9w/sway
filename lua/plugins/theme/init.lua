local theme_plugins = {}

theme_plugins.plugins = {
    'folke/tokyonight.nvim'
}

function theme_plugins.load()
    vim.g.tokyonight_style = 'day'
    vim.cmd[[colorscheme tokyonight]]
end

return theme_plugins