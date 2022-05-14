local theme_plugins = {}

theme_plugins.plugins = {
    'folke/tokyonight.nvim',
    'projekt0n/github-nvim-theme',
    -- 'ishan9299/nvim-solarized-lua',
    'ch4xer/nvim-solarized-lua-transparent',
}


function theme_plugins.load()
    -- vim.g.tokyonight_style = "storm"
    -- vim.cmd[[colorscheme tokyonight]]

    -- solarized_flat.load_syntax(darkColors)
    -- solarized_flat.terminal_colors(darkColors)
    vim.cmd[[colorscheme solarized-flat]]
    -- require('lualine').setup{options={theme='tokyonight'}}
    require('lualine').setup{}

    -- vim.cmd[[hi! Normal ctermbg=none ctermfg=none guifg=none guibg=none guisp=none]]

    -- require('github-theme').setup({theme_style='dark_default'})

end

return theme_plugins
